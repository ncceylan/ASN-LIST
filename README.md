

策略路由分流的实现方法：

**CN.rsc** 是往Firewall - address lists 里生ip段列表。



策略路由分流的实现方法：

**CN.rsc** 是往routing filter num-list 里生ASN段列表。
```
/file remove [find name="CN.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/ncceylan/chnroute@main/CN.rsc"
:if ([:len [/file find name=CN.rsc]] > 0) do={
/routing filter num-list remove [find list="CN"]
/import CN.rsc
}
```

**CMCC.rsc** 是往routing filter num-list 里生ASN段列表。
```
/file remove [find name="CMCC.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/ncceylan/chnroute@main/CMCC.rsc"
:if ([:len [/file find name=CMCC.rsc]] > 0) do={
/routing filter num-list remove [find list="CMCC"]
/import CMCC.rsc
}
```

**CT.rsc** 是往routing filter num-list 里生ASN段列表。
```
/file remove [find name="CT.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/ncceylan/ASN-LIST@main/CT.rsc"
:if ([:len [/file find name=CT.rsc]] > 0) do={
/routing filter num-list remove [find list="CT"]
/import CT.rsc
}
```


用于Firewall - mangle页，通过dst-addrss= 引用
