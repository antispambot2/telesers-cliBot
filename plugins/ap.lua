do

local function run(msg, matches)
  local eq = URL.escape(matches[1])

  local url = "https://cafebazaar.ir/search/?q=="..eq

  local receiver = get_receiver(msg)
  send_photo_from_url(receiver, url, send_title, {receiver, title})
end

return {
  patterns = {
    "^[/#!][Aa][Pp][Kk] (.+)$",
  },
  run = run
}

end

— @puoker
