do
 function run(msg, matches)
local text = [[  
راهنما کامل رباتtelesers:

برای دریافت لیست دستورات مدیریت گروه:
help
_________________________
برای دریافت لیست ابزار ها:
!helppl
-------------------------
]]
return text
end
return {
patterns = {
"^(helps)$",
},
run = run
}
end
