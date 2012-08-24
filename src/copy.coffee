fs = require 'fs'
sysPath = require 'path'
mkdirp = require 'mkdirp'
{exec, spwan} = require 'child_process'

pwd = process.cwd()


copyGit = (form, dest = pwd) ->


copySVN = (from, dest = pwd) ->

copyLocal = (from, dest = pwd) ->
  fs.readdir from, (err, files) ->
    files.forEach (file) ->
      # ...
    
    
  
  
  


module.exports = (from, dest = pwd) ->




