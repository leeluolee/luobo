'use strict'
fs = require 'fs'
path = require 'path'

mkdirp = require 'mkdirp'
fs = require 'fs'
sys = require 'path'

module.exports =
    create: (from, root, callback) ->
      console.log __dirname,__filename,'index create'
      fs.unlink (path.join ['__dirname','..','tfs']) ,(err) ->
        throw err if err?
        console.log 'successfully unlink file',arguments

    server: (port = 8008, autoreload = true ) ->
      app = express()
      console.log "haha"
      # ...
    
    
console.log "hahah"

exports.server()
      



    
