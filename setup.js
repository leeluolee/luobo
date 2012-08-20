var exec = require('child_process').exec;
var sysPath = require('path');

exec("node "+sysPath.join('node_modules', 'coffee-script', 'bin', 'coffee')+" -o lib/ src/",function(err){
  if(err) throw err;
  console.log("build complete");
})