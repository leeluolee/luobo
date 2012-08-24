sysPath = require "path"


COLON = if process.platform is "win32" then ";" else ":"

# 是否是绝对路径
isAbsPath = (path) -> path.charAt(0) is "/"
# 是否是可运行程序
isExeAble = (cmd) ->
  
  

getCMD = (cmd) ->
  return cmd if isAbsPath(cmd)
  runPathes = process.env.PATH.split(COLON);
  runPathes.forEach (path, index) ->
    testCMD = sysPath.join path, cmd

    console.log index
    # ...
  
module.exports = file =
  getCMD : getCMD
  


