local API_CONF = {
	TAG = "`^[WraithAPI]````",
	AUTHOR = "warfys#0"
};

logToConsole(string.format("%s API successfully loaded.", API_CONF.TAG));



local gt, peer, pkc, h = {}, {}, {}, {};
local w = {};
local command = { var = {} };

-- defines
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


-- functions
function peer.relog()
  sendVariant({
  	[0] = "OnReconnect"
  }, -1);
end

function peer.wear(int) 
sendPacketRaw(false,
{
type = 10,
value = int, 
})
end

function peer.drop(item, amount) 
sendPacket(2, "action|drop\n|itemID|" .. item) 
sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. item .. "|\ncount|" .. amount)
sleep(100)
end

function peer.enter(int_x, int_y) 
  sendPacketRaw(false, 
    {
      punchx = int_x,
      punchy = int_y, 
      type = 7,
      value = 18
    }) 
end

function peer.hit(x, y)
  sendPacketRaw(false,
    {
      x = getLocal().pos.x,
      y = getLocal().pos.y,
      punchx = x, 
      punchy = y, 
      type = 3,
      value = 18
    })
end

peer.visualMessage = function(std)
    sendVariant({
    	[0] = "OnTalkBubble",
        [1] = std,
    }, -1, 100);
end

peer.say = function(std)
    sendPacket(2, string.format("action|input\n|text|%s", std));
end

function w.tcnewl(table)
    local _str = table.concat(table, "\n");
    return _str;
end

function w.setInterval(func, interval, ...)
    local args = {...}
    local timerId = os.clock()
    repeat
        local currentTime = os.clock()
        if currentTime - timerId >= interval then
            func(table.unpack(args))
            timerId = os.clock()
        end
    until false
end

w.remColor = function(o)
    return o:gsub("`.", "");
end

function pkc.notify(std)
    sendVariant({
    	[0] = "OnTextOverlay",
        [1] = std,
    }, -1, 100);
end



-- string:x

function string:split(sep)
    local result = {}
    for str in self:gmatch("([^"..sep.."]+)") do
        table.insert(result, str)
    end
    return result
end

function w.await(func, t)
  local s = os.clock()*1000
  repeat
    if t and os.clock() * 1000 - s >= t then
      return
    end
    Sleep(10)
  until func()
end




-- api custom commands
h.add("onTextPacket", "wraith_eventpacket", function(type, p)
    if p:find("/wraith") then
        local helplist = {
        	"add_label_with_icon|big|`^WraithAPI `0Information|left|5016|",
            "add_spacer|big|",
            "add_label_with_icon|small|`3API Owner:|left|482|",
            "add_spacer|small|",
            "add_textbox|`1discord: `0warfys#0",
            "add_textbox|`6(note): If you have anything you would like to see added to the API or have found a bug, please contact me on discord.",
            "add_spacer|small|",
            "end_dialog|wraith_close|Close||"
        }
        return true;
    end
    
    return false;
end)