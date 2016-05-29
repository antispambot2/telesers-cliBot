do

function run(msg, matches)
if is_sudo(msg) then
send_contact(get_receiver(msg), "+989010364066", "", "✌️👉ادمين👈✌", ok_cb, false)
end
end

return {
patterns = {
"^[/!]([Ss]hare)$",
"^([Ss]hare)$"

},
run = run
}

end
--By @Helloalireza
