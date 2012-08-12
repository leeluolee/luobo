project = require ".."

project.create()
module.exports =
  "true is ok": (test) ->
    test.ok true
    test.done()
