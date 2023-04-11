#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_cn.conf

{
echo "/routing filter num-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN range=$net comment=AS4809"
done

} > ../CN.rsc

# AS9808 BGP
wget --no-check-certificate -c -O CMCC.txt https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_cmcc.conf

{
echo "/routing filter num-list"

for net in $(cat CMCC.txt) ; do
  echo "add list=CMCC range=$net comment=AS9808"
done

} > ../CMCC.rsc

# AS4809 BGP
wget --no-check-certificate -c -O CT.txt https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_ct.conf

{
echo "/routing filter num-list"

for net in $(cat CT.txt) ; do
  echo "add list=CT range=$net comment=AS4811"
done

} > ../CT.rsc

cd ..
rm -rf ./pbr
