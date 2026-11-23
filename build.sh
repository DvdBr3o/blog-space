#!/usr/bin/env bash
# --------------------------------------------------------------------
# Builds this Hugo site on Vercel.
# Vercel cannot fetch submodules over SSH, so .gitmodules must use HTTPS.
# --------------------------------------------------------------------

set -euo pipefail

DART_SASS_VERSION=1.108.2
HUGO_VERSION=0.170.1

build_temp_dir=""
cleanup() {
  if [[ -n "${build_temp_dir:-}" && -d "${build_temp_dir}" ]]; then
    rm -rf "${build_temp_dir}"
  fi
}
trap cleanup EXIT SIGINT SIGTERM

main() {
  echo "==> Initializing Git submodules"
  git submodule update --init --recursive
  git submodule status

  case "$(uname -m)" in
    x86_64) hugo_arch="amd64" sass_arch="x64" ;;
    aarch64 | arm64) hugo_arch="arm64" sass_arch="arm64" ;;
    *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
  esac

  build_temp_dir="$(mktemp -d)"
  bin_dir="${HOME}/.local/bin"
  mkdir -p "${bin_dir}"

  echo "==> Installing Dart Sass ${DART_SASS_VERSION}"
  curl -sSfL -o "${build_temp_dir}/dart-sass.tar.gz" \
    "https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-${sass_arch}.tar.gz"
  tar -xzf "${build_temp_dir}/dart-sass.tar.gz" -C "${build_temp_dir}"
  cp -R "${build_temp_dir}/dart-sass/." "${bin_dir}/"

  echo "==> Installing Hugo extended ${HUGO_VERSION}"
  curl -sSfL -o "${build_temp_dir}/hugo.tar.gz" \
    "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${hugo_arch}.tar.gz"
  tar -xzf "${build_temp_dir}/hugo.tar.gz" -C "${bin_dir}" hugo
  chmod +x "${bin_dir}/hugo" "${bin_dir}/sass"

  export PATH="${bin_dir}:${PATH}"

  echo "==> Tool versions"
  sass --version
  hugo version

  echo "==> Building site"
  hugo --gc --minify
}

main "$@"
