os = require 'os'
extend = (o1, o2, override) ->
  o1[i] = o for i,o of o2 when not o1[i] or override


module.exports = 
  # 扩展对象
  extend: (o1, o2, override) ->
    o1[i] = o for i,o of o2 when not o1[i] or override

  # 获得本地所有非internal 的ip  
  getLocalIP: ->
    netInterfaces = do os.networkInterfaces
    results = []
    for i,inf of netInterfaces
      results.push "#{i} : #{item.address}" for item in inf when item.family is "IPv4" and not item.internal
    results
  # 简单截取日期输出
  formatDate: (date) ->
    date or= Date.now()
    str = date.toString()
    index = str.indexOf("GMT")
    # return
    str.slice(0,index-1)

  



  