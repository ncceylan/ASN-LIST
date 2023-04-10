#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://github.com/ncceylan/chnroute/blob/main/asn_cn.txt

{
echo "/routing filter num-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN range=$net comment=AS4809"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
