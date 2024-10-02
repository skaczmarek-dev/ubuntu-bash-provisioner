#!/bin/bash

rm ./ubp.sh
touch ./ubp.sh

cat ./bin/head >> ./ubp.sh
cat ./bin/utils >> ./ubp.sh
cat ./bin/admin >> ./ubp.sh
cat ./bin/essentials >> ./ubp.sh
cat ./bin/hardening >> ./ubp.sh
cat ./bin/physical_server_utils >> ./ubp.sh
cat ./bin/ovpn_server >> ./ubp.sh
cat ./bin/docker_server >> ./ubp.sh
cat ./bin/nfs_server >> ./ubp.sh
cat ./bin/luks >> ./ubp.sh
cat ./bin/raid1 >> ./ubp.sh
cat ./bin/flow >> ./ubp.sh

chmod +x ./ubp.sh