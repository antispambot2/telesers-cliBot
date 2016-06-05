local function get_msgs_user_chat(user_id, chat_id)
  local user_info = {}
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info.msgs = tonumber(redis:get(um_hash) or 0)
  user_info.name = user_print_name(user)..' ['..user_id..']'
  return user_info
end
local function member_html(ex,suc,res)
local text = '<html><head><meta charset="UTF-8"><title>Sbss</title></head><body bgcolor="#404040"><center><font size=5 face=tahoma color=#cc0030><b>Sbss - Members Log Pro</b></font><br><font size=3 face=tahoma color=#ffffff>Group Name: <b>'..res.print_name..'</b><br>Group ID: <b>'..res.id..'</b><br>People: <b>'..res.members_num..'</b></font><br><br><font size=2 face=tahoma color=#000000><table width=750 bgcolor="#efefef" border=1 cellSpacing=1 cellPadding=1><tr><td width="5%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>#</b></font></td><td width="40%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>Last and First Name</b></font></td><td width="22%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>Username</b></font></td><td width="18%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>Phone Num</b></font></td><td width="15%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>ID</b></font></td><td width="15%" align="center" valign="middle" bgcolor="#cc0030"><font color=#ffffff><b>Massage Sent</b></font></td></tr>'
print('setup3')
for i,user in pairs(res.members) do
local hashs = 'msgs:'..user.id..':'..res.id
local phone , username , name , msgss = '-----' , '-----' , 'Deleted Account' , '0'
if redis:get(hashs) then
msgss = redis:get(hashs)
end
if user.phone then
phone = '+'..user.phone:sub(1,-5)..'****'
end
if user.username then
username = '@'..user.username
end
if user.first_name then
name = user.print_name:gsub(' ','_')
end
if user.last_name then
name = name..' 'user.last_name:gsub(' ','_') 
end
text = text..'<tr><td align="center">'..i..'</td><td>'..name..'</td><td align="center">'..username..'</td><td align="center">'..phone..'</td><td align="center">'..user.id..'</td><td align="center">'..msgss..'</td></tr>'
end
text = text..'</table><br><br></font><font size=3 face=tahoma><b><a href="https://telegram.me/Sbss_Team" target="_blank">#Sbss_Team</a></b></center></font><br></body></html>'
local file = io.open('groups/members.htm','w')
file:write(text)
file:close()
end
local function run(msg,matches)
if msg.to.type == 'chat' then
send_document(get_receiver(msg),'./groups/members.htm',ok_cb,false)
if is_momod(msg) then
chat_info('chat#id'..msg.to.id,member_html,false)
end
end
end
return {
patterns = {
'^[Mm]embers (html)$',
'^[!/#][Mm]embers (html)$'
},
run = run,
}                                      
