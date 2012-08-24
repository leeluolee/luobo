# project = require "../lib"
fs = require 'fs'
path = require 'path'
helper = require "../lib/helper"
mkdirp = require 'mkdirp'

fs.readdir "/home/code/dazuoye/2", (err, files) ->
  files.forEach (file) ->
    console.log file
  
  
    # ...
  
  
  # ...


module.exports =
  "true is ok": (test) ->
    test.ok true
    test.done()
  "unlink should delete the file" : (test) ->
    # fs.unlink path.join('..','README.md'), (err) ->
    #   console.log err if err?
      test.done()
  # "write with flag w should add the file" : (test) ->
  #   fs.writeFile path.join('..','README.md'), "hahahaha" ,(err) ->
  #     console.log err if err?
  #     test.done()

  "helper getLocalIP will get the local outer" : (test) ->
    console.log helper.getLocalIP()
    test.done()
  
  



  
    
    
    
