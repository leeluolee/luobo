fs = require "fs"
sysPath = require "path"
{spawn, exec} = require "child_process"
mkdirp = require "mkdirp"


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

writeFile = (path, source, callback) -> 
  dirname = sysPath.dirname path
  # 首先判断是否存在文件夹
  fs.stat dirname, (err, stat) ->
    if err? or not stat.isDirectory() 
      mkdirp dirname, (err) ->
        return callback err if err?
        fs.writeFile path, source, callback 
    else
      fs.writeFile path, source, callback 
      

      
      

    
  
  


# wraper js
wrapJs = (source, id) ->
  """
  define(#{id}, function(require, exports, module){
    #{source.replace(/\n(?!\n)/g, '\n  ')}
  });
  """
wrapFile = (filename, dest) ->






module.exports =
  getCMD: getCMD
  writeFile: writeFile
  
   
  


