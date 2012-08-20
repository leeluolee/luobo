{exec} = require "child_process"
os = require 'os'

# 1.helper
##############################################

extend = (o1, o2, override) ->
  o1[i] = o for i,o of o2 when not o1[i] or override

getLocalIP = ->
  netInterfaces = do os.networkInterfaces
  results = []
  for i,inf of netInterfaces
    results.push item.address for item in inf when item.family is "IPv4" and not item.internal
  results



# 2.exposure
##############################################

extend exports,
  extend:extend
  getLocalIP:getLocalIP
  



