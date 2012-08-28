fs = require 'fs'
sysPath = require "path"
{file, logger} = require "./helper"
coffee = require "coffee-script"

# wraper js
wrapJs = (source, id) ->
  """
  define(#{id}, function(require, exports, module){
    #{source.replace(/\n(?!\n)/g, '\n  ')}
  });
  """
  
compiler = 
  coffee : (source) ->
    coffee.compile source, bare:true
  js: (source) ->
    source
  
  


wrapFile = (from, dest) ->
  extname = sysPath.extname(from).slice 1
  fs.readFile from, "utf8", (err, data) ->
    return logger err if err?
    source = compile[extname] data
    file.writeFile dest, data, (err) ->
      logger.error err if err?

# dir version
wrapDir = (from, dest) ->
  find = (require "findit").


wrap = (from, dest) ->
  # ...




module.exports = 
  # test stuff
  coffee: compiler.coffee
  # exposure api

