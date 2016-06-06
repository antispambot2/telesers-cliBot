do

local function run(msg, matches)
    if not is_owner(msg) then
        return "ℹ️شما مجاز نیستید!"
       end
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)

local text = jdat.ENtime

  local b = 1

  while b ~= 0 do
    textc = text:trim()
    text,b = text:gsub(' ','.')
    
    
  if msg.to.type == 'user' then 
      return
      else
    local cmd = io.popen('curl http://cruel-plus.ir/time.php')
      local result = cmd:read('*all')
    cmd:close()
  local url = "http://api.magic-team.ir/atime.php?text=@CRUELTeam&t="..textc
  local receiver = get_receiver(msg)
  local file = download_to_file(url,'t'..msg.from.id..'.png')
      send_photo2(receiver, file, result, rmtmp_cb, cb_extra)
  
end
end
  end
return {
  description = "text to sticker",
  usage = {
    "!time"
  },
  patterns = {
    "^[!/#]times$",

  },
  run = run
}  
end
