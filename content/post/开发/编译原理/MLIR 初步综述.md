---
title: MLIR 初步综述
date: 2026-01-29T14:45:09+08:00
lastmod: 2026-01-29T17:21:47+08:00
tags:
  - mlir
publish: true
---

## 基础

1. dialect
	1. standard dialect
	2. affine dialect
	3. scf dialect (structured control flow)
	4. linalg dialect
2. pass / lowering
	1. high-level $\sim$ domain specific level
		1. operator fusion
		2. layout transformations
		3. algorithmic optimizations
		4. R. Yadav et al., "Composing Distributed Computations Through Task and Kernel Fusion," 2024. DOI: [10.48550/arxiv.2406.18109](https://doi.org/10.48550/arxiv.2406.18109)
		5. "Composable and Modular Code Generation in MLIR: A Structured and Retargetable Approach to Tensor Compiler Construction," 2022. DOI: [10.48550/arxiv.2202.03293](https://doi.org/10.48550/arxiv.2202.03293)
	2. polyhedral $\sim$ affine level
		1. loop tiling
		2. interchange
		3. parallelization
		4. A. George, "Portable Sparse Polyhedral Framework Code Generation Using Multi Level Intermediate Representation." DOI: [10.18122/td.2081.boisestate](https://doi.org/10.18122/td.2081.boisestate)
		5. S. Thangamani, "Optimized Code Generation for Parallel and Polyhedral Loop Nests using MLIR."
	3. hardware-specific 
		1. memory coalescing
		2. register allocation
		3. instruction scheduling
		4. T. Gysi et al., "Domain-Specific Multi-Level IR Rewriting for GPU: The Open Earth Compiler for GPU-accelerated Climate Simulation," _ACM Transactions on Architecture and Code Optimization_, 2021. DOI: [10.1145/3469030](https://doi.org/10.1145/3469030)
		5. I. Katel et al., "MLIR-based code generation for GPU tensor cores," in _International Conference on Compiler Construction_, 2022. DOI: [10.1145/3497776.3517770](https://doi.org/10.1145/3497776.3517770)

## 现状

### CPU-GPU

1. GPU Codegen (简化 GPU 编程模型)
	1. thread/parallelism model
		1. mlir gpu dialect
	2. tensor core utilization
		1. I. Katel et al., "High Performance GPU Code Generation for Matrix-Matrix Multiplication using MLIR: Some Early Results," _arXiv: Distributed, Parallel, and Cluster Computing_, 2021.
		2. I. Katel et al., "MLIR-based code generation for GPU tensor cores," in _International Conference on Compiler Construction_, 2022. DOI: [10.1145/3497776.3517770](https://doi.org/10.1145/3497776.3517770)
	3. memory management
		1. T. Gysi et al., "Domain-Specific Multi-Level IR Rewriting for GPU: The Open Earth Compiler for GPU-accelerated Climate Simulation," _ACM Transactions on Architecture and Code Optimization_, 2021. DOI: [10.1145/3469030](https://doi.org/10.1145/3469030)
2. CPU-GPU Coord (异构计算)
	1. MLIR based SYCL
	2. memory management
		1. major concern
			1. minimizing data transfer overhead
			2. maximizing memory bandwidth utilization
			3. ensuring correct synchronization
				1. W. Moses et al., "High-Performance GPU-to-CPU Transpilation and Optimization via High-Level Parallel Constructs," in _ACM SIGPLAN Symposium on Principles & Practice of Parallel Programming_, 2022. DOI: [10.1145/3572848.3577475](https://doi.org/10.1145/3572848.3577475)
				2. W. Moses et al., "High-Performance GPU-to-CPU Transpilation and Optimization via High-Level Parallel Constructs," 2022. DOI: [10.48550/arxiv.2207.00257](https://doi.org/10.48550/arxiv.2207.00257)
		2. unified memory & managed memory
3. Performance Portablility (跨平台/跨架构, write once run anywhere)
	1. codegen for specific platforms
	2. programming model abstraction
		1. SYCL
		2. CUDA
		3. OpenMP
	3. transpilation
		1. CUDA to CPU-threaded using MLIR
			1. W. Moses et al., "High-Performance GPU-to-CPU Transpilation and Optimization via High-Level Parallel Constructs," in _ACM SIGPLAN Symposium on Principles & Practice of Parallel Programming_, 2022. DOI: [10.1145/3572848.3577475](https://doi.org/10.1145/3572848.3577475)
			2. W. Moses et al., "High-Performance GPU-to-CPU Transpilation and Optimization via High-Level Parallel Constructs," 2022. DOI: [10.48550/arxiv.2207.00257](https://doi.org/10.48550/arxiv.2207.00257)
	4. adaptive compilation

### 基础设施

1. 重写案例
	1. IREE
	2. flang: fortran compiler in MLIR
	3. domain specific compilers
	4. MLIR-Forge：B. Ates et al., "MLIR-Forge: A Modular Framework for Language Smiths."
2. 兼容案例
	1. LLVM integration (seamlessly)
	2. machine learning framework integration
		1. TensorFlow XLA
		2. torch-mlir: [GitHub - llvm/torch-mlir: The Torch-MLIR project aims to provide first class support from the PyTorch ecosystem to the MLIR ecosystem.](https://github.com/llvm/torch-mlir)
	3. HLS (high-level synthesis)
		1. SODA-OPT: N. Agostini et al., "An MLIR-based Compiler Flow for System-Level Design and Hardware Acceleration," in _Proceedings of the 41st IEEE/ACM International Conference on Computer-Aided Design_, 2022. DOI: [10.1145/3508352.3549424](https://doi.org/10.1145/3508352.3549424)
	4. programming model integration
		1. MLIR-SYCL

## 近期进展

1. MLIR-based SYCL
	1. A. Tiotto et al., "Experiences Building an MLIR-Based SYCL Compiler," 2024. DOI: [10.1109/cgo57630.2024.10444866](https://doi.org/10.1109/cgo57630.2024.10444866)
2. task / kernal futsion
	1. R. Yadav et al., "Composing Distributed Computations Through Task and Kernel Fusion," 2024. DOI: [10.48550/arxiv.2406.18109](https://doi.org/10.48550/arxiv.2406.18109)
3. MLIR-based mojo
	1.  W. Godoy et al., "Mojo: MLIR-Based Performance-Portable HPC Science Kernels on GPUs for the Python Ecosystem," 2025. DOI: [10.1145/3731599.3767573](https://doi.org/10.1145/3731599.3767573)
4. MLIR opt for loop vectorization (fft)
	1. R. He et al., "Leveraging MLIR for Loop Vectorization and GPU Porting of FFT Libraries," _Lecture Notes in Computer Science_, 2024. DOI: [10.1007/978-3-031-50684-0_16](https://doi.org/10.1007/978-3-031-50684-0_16)

## 未来方向

1. Automatic Dialect Generation and Synthesis
2. Advanced Memory Management
3. Dynamic and Adaptive Compilation
4. Distributed and Multi-Device Optimization
5. Formal Verification and Correctness
6. ~~Energy Efficiency and Sustainability~~
7. ~~Quantum and Emerging Architectures~~
8. ~~Improved Developer Experience~~
9. Integration with Machine Learning
10. Standardization and Interoperability