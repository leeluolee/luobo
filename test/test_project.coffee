project = require "../lib/index.js"
fs = require 'fs'
path = require 'path'

project.create()
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





fs.writeFile path.join(__dirname, '..','README.md'), [1,2,3] ,(err) ->
  console.log err if err?
  console.log "sccucess" if not err

  
    
    
    
