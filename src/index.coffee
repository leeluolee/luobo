'use strict'
fs = require 'fs'
sysPath = require 'path'
mkdirp = require 'mkdirp' # mkdirp
express = require 'express'
http = require 'http'
io = require 'socket.io'
watch = require 'watch-tree-maintained'
helper = require './helper'


# global arg

pwd = process.cwd()
argv = process.argv.slice 2
ip = helper.getLocalIP()

# helper function


# autoReload stuff
#   app means express instance
autoReload = (server, app, port = 80,path = pwd) ->

  # 注意如果没有encoding的参数 则会返回buffer
  # reloadJsContent = fs.readFileSync (sysPath.join __dirname, '..', 'vendor','socket_autoreload.js'), 'utf8'
  # reloadJsContent +=

  # 利用stream在res中输入内容
  app.get "/reload.js" ,(req, res) ->
    res.setHeader "Content-Type", "text/javascript"
    
    stream = fs.createReadStream (sysPath.join __dirname, '..', 'vendor','socket_autoreload.js'), encoding : 'utf8'
    stream.pipe res, end: false;

    stream.on "end", ->
      console.log "stream end"
      res.write "var socket = io.connect( 'http://#{ip}:#{port}'); socket.on('update', function(data){window.location.reload(); })"
      res.end()

    req.on 'close', ->
      stream.destroy();


  # 捕获所有html.xhtml的内容 TODO: 自动注入script
  # app.get /(.*\/\w*.(?:html|htm|xhtml))$/, (req, res, next) ->
  #   res.send req.params
  # pre insert script
  # watch file
  matches = [
    'js', 'coffee', 'css', 'less', 'styl',
    'html', 'xhtml', 'htm', 'tpl', 'php',
    'md', 'markdown', 'mkd', 'txt'
  ]
  io = io.listen server

  io.sockets.on "connection" , (socket) ->
    watcher = (require "watch-tree-maintained").watchTree path, 
      "match" : "\." + matches.join '$|\\.'
      "sample-rate" : 2 

    watcher.on "fileModified" ,(path) ->
      socket.emit "update", "path": path

    console.log "socket watching the files in#{path} modified"
    
# 1.exposure
##############################################
module.exports =
    create: (from, root, callback) ->
      fs.unlink (sysPath.join ['__dirname', '..', 'tfs']) ,(err) ->
        throw err if err?
        console.log 'successfully unlink file', arguments

    server: (port = 8008, hasAutoreload = true) ->
      app = express()
      app.configure ->
        app.use express.methodOverride()
        app.use express.bodyParser()
        app.use express.static pwd  #在当前目录设置server

      server = http.createServer app
      autoReload server, app, port if hasAutoreload # start the websocket
      # server.listen port, ->       #  start the server
      #   console.log "server start at localhost(#{ip}):8008"
      #   (require "open") "http://#{ip}:#{port}"
      #   console.log "will automately open the browser if i can"

    copy: require "./copy"      

module.exports.server()