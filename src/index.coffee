'use strict'
fs = require 'fs'
path = require 'path'

module.exports = 
  create: ->
    fs.unlink path.join(__dirname,"..",'README.md'), (err) ->
      console.log 'succsess' if not err

    
    
      
    
    
