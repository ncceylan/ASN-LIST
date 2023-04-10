大陆白名单路由规则

ip段信息取自 [china-ip-list](https://github.com/mayaxcn/china-ip-list)

由Github Action自动构建于此。

策略路由分流的实现方法：

**CN.rsc** 是往Firewall - address lists 里生ip段列表。
```
/file remove [find name="CN.rsc"]
/tool fetch url="https://github.com/ncceylan/chnroute/blob/main/CN.rsc"
:if ([:len [/file find name=CN.rsc]] > 0) do={
/ip firewall address-list remove [find comment="AS4809"]
/import CN.rsc
}
```

用于Firewall - mangle页，通过dst-addrss= 引用
