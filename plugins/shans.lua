local database = 'http://vip.opload.ir/vipdl/95/1/rezasoft80/'
local function run(msg)
 local res = http.request(database.."number.db")
 local number = res:split(",") 
 return number[math.random(#number)]
end
return {
 description = "پلاگین عدد شانسی",
 usage = "دریافت عدد شانس خود",
 patterns = {
  "^عدد شانسی$"
  },
 run = run
}
