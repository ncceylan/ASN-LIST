#!/bin/sh

# 函数定义
download_and_create_filter() {
    local file_name="$1"
    local list_name="$2"
    local url="$3"
    local output_file="$4"

    wget --no-check-certificate -c -O "$file_name" "$url"

    {
        echo "/routing filter num-list"

        for net in $(cat "$file_name") ; do
            echo "add list=$list_name range=$net"
        done

    } > "$output_file"
}

# 主程序
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
download_and_create_filter "CN.txt" "CN" "https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_cn.conf" "../CN.rsc"

# AS9808 BGP
download_and_create_filter "CMCC.txt" "CMCC" "https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_cmcc.conf" "../CMCC.rsc"

# AS4809 BGP
download_and_create_filter "CT.txt" "CT" "https://raw.githubusercontent.com/ncceylan/China-ASN/main/asn_ct.conf" "../CT.rsc"

cd ..
rm -rf ./pbr
