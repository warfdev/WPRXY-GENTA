## Changelogs;

#### custom defines;
```lua
h.add = AddHook;
h.sleep = sleep;
gt.log, gt.doLog = logToConsole, doLog;
gt.scheat = toggleCheat;
gt.gcheat = getCheat;
peer.discordID = getDiscordID;
pkc.webhook = sendWebhook;
pkc.http = makeRequest;
gt.collect = requestCollect;
peer.mac = getMac;
peer.gid = getGid;
peer.setGid = setGid;
peer.setMac = setMac;
gt.raw = sendPacketRaw;
gt.packet = sendPacket;
peer.me = getLocal;


-- variable(s);
command.var = {}; -- You can define your command variables here.
-- example; command.var.isPeerFly = false;
```

#### Functions;
```lua
peer.
    relog();
    wear(int);
    drop(int itemid, int amount);
    enter(int x, int y);
    hit(int x, int y);
    visualMessage(str);
    say(str);

w.
    tcnewl(var);
    setInterval(function, int interval, ...);
    remColor(str);
    await(function, int time);

pkc.
    notify(str);


-- string method(s)
string:
      split(str sep);
```