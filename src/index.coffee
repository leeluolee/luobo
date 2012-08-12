'use strict'

mkdirp = require 'mkdirp'
fs = require 'fs'
sys = require 'path'

module.export = 
    create: (from, root, callback) ->
      console.log __dirname,__filename,'index create'
      fs.unlink (path.join ['__dirname','..','tfs']) ,(err) ->
        throw err if err?
        console.log 'successfully unlink file',arguments

      


    
