---
title: self host livesync
date: 2025-07-13T18:36:31+08:00
lastmod: 2025-07-14T01:13:23+08:00
tags:
  - Obsidian
  - livesync
categories: Obsidian
publish: true
---

@ `start-obsidian-livesync-couchdb.sh`:
```bash
#!/bin/bash
mkdir -p couchdb-data
mkdir -p couchdb-etc

docker run --name couchdb-for-obsidian -d --restart always -e COUCHDB_USER=dvdbr3o -e COUCHDB_PASSWORD=daijunze2014 -v ${PWD}/couchdb-data:/opt/couchdb/data -v ${PWD}/couchdb-etc:/opt/couchdb/etc/local.d -v /opt/couchdb/local.ini:/opt/couchdb/etc/local.ini -p 5984:5984 couchdb
```

@ `create-couchdb-dvdbr3o-db.sh`:
```bash
#!/bin/bash
curl -X PUT https://dvdbr3o:daijunze2014@localhost:5984/dvdbr3o
```

@ `gen-uri.sh`:
```bash
#!/bin/bash

deno run -A https://raw.githubusercontent.com/vrtmrz/obsidian-livesync/main/utils/flyio/generate_setupuri.ts
```

@ `couchdb-init.sh`:
```bash
#!/bin/bash
if [[ -z "$hostname" ]]; then
    echo "ERROR: Hostname missing"
    exit 1
fi

if [[ -z "$username" ]]; then
    echo "ERROR: Username missing"
	exit 1
fi

if [[ -z "$password" ]]; then
	echo "ERROR: Password missing"
	exit 1
fi

echo "-- Configuring CouchDB by REST APIs... -->"

until (curl -X POST "${hostname}/_cluster_setup" -H "Content-Type: application/json" -d "{\"action\":\"enable_single_node\",\"username\":\"${username}\",\"password\":\"${password}\",\"bind_address\":\"0.0.0.0

\",\"port\":5984,\"singlenode\":true}" --user "${username}:${password}"); do sleep 5; done                                                                            

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/chttpd/require_valid_user" -H "Content-Type: application/json" -d '"true"' --user "${username}:${password}"); do sleep 5; done                      

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/chttpd_auth/require_valid_user" -H "Content-Type: application/json" -d '"true"' --user "${username}:${password}"); do sleep 5; done                 

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/httpd/WWW-Authenticate" -H "Content-Type: application/json" -d '"Basic realm=\"couchdb\""' --user "${username}:${password}"); do sleep 5; done      

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/httpd/enable_cors" -H "Content-Type: application/json" -d '"true"' --user "${username}:${password}"); do sleep 5; done                              

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/chttpd/enable_cors" -H "Content-Type: application/json" -d '"true"' --user "${username}:${password}"); do sleep 5; done                             

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/chttpd/max_http_request_size" -H "Content-Type: application/json" -d '"4294967296"' --user "${username}:${password}"); do sleep 5; done             

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/couchdb/max_document_size" -H "Content-Type: application/json" -d '"50000000"' --user "${username}:${password}"); do sleep 5; done                  

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/cors/credentials" -H "Content-Type: application/json" -d '"true"' --user "${username}:${password}"); do sleep 5; done                               

until (curl -X PUT "${hostname}/_node/nonode@nohost/_config/cors/origins" -H "Content-Type: application/json" -d '"app://obsidian.md,capacitor://localhost,http://localhost"' --user "${username}:${password}");

 do sleep 5; done                                                                                                                                                                                               

echo "<-- Configuring CouchDB by REST APIs Done!"
```

