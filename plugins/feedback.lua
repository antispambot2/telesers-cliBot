do

function run(msg, matches)

local fuse = '#newfeedback \n\nID â–¶ï¸ : ' .. msg.from.id .. '\n\nGROUP ID â–¶ï¸ : '..msg.to.id..'\n\nNameâ–¶ï¸ : ' .. msg.from.print_name ..'\n\nusername â–¶ï¸ :@'..(msg.from.username or 'Ù†Ø¯Ø§Ø±Ø¯')..'\n\nPhone number â–¶ï¸ :+'..(msg.from.phone or 'Ù†Ø¯Ø§Ø±Ø¯')..'\n\nðŸ…¿ï¸â™ï¸ :\n\n\n' .. matches[1] 
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '123')
        bannedidtwo =string.find(msg.from.id, '465')       
   bannedidthree =string.find(msg.from.id, '678')  


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                   
                return 'You are banned to send a feedback'
 else


                 local sends0 = send_msg('channel#1065958052', fuse, ok_cb, false)

 return 'Ù¾ÛŒØ§Ù… Ø´Ù…Ø§ Ø¨Ø§ Ù…ÙˆÙÙ‚ÛŒØª Ø¨Ø±Ø§ÛŒ Ù…Ø§ Ø§Ø±Ø³Ø§Ù„ Ø´Ø¯!'

     

end

end
return {
  description = "Feedback",

  usage = "feedback : Ø§Ø±Ø³Ø§Ù„ Ù¾ÛŒØ§Ù… Ø¨Ù‡ Ø§Ø¯Ù…ÛŒÙ† Ù‡Ø§ÛŒ Ø±Ø¨Ø§Øª",
  patterns = {
    "^[/#!][Ff]eedback (.*)$"

  },
  run = run
}

end
