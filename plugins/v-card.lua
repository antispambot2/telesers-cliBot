do
 function run(msg, matches)
local text = [[ 
Team member ID card
_____________________
Name: Alireza Deadly
Username: @HelloAlireza
Rank: Sudo
Phone number: +989010364066
---------------------
]]
return text
end
return {
patterns = {
"^vcard$",
},
run = run
}
end
