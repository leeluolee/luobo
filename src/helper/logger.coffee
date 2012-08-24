colorify = require "./colorify"
util = require "./util"

Level = 
  error : "red"
  warn : "yellow"
  done : "green"
  info : "blue"
  debug : "brightBlack"

createLogger = (type) ->
  logFn = console[type] or console.log
  color = Level[type]
  suffix = if color? then colorify(type.toUpperCase(), color) else ""
  log[type] = (msg...) ->
    now = util.formatDate new Date
    dateInfo = colorify now,"cyan"
    logFn "#{suffix}\t #{dateInfo}:", msg...  

module.exports = log = 
  log : (type, msg...) ->
    log[type] msg...

createLogger type for type of Level


  
  
