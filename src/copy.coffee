sysFs = require 'fs'
sysPath = require 'path'
# mkdirp = require 'mkdirp'
{exec, spawn} = require 'child_process'
{ncp} = require 'ncp'
{logger}  = require "./helper"



# local variable
pwd = process.cwd()
fsExists = sysFs.exists || sysPath.exists
gitReg = /^(https|http)\:.*git/
svnReg = /^(https|http)\:.*svn/

# private function

# copy from git (defaults github)
copyGit = (from, dest, cb) ->
  args = ["clone",from ,dest] 
  git = spawn "git",args
  git.stdout.on "data", (data) ->
    logger.info "stdout:#{data}" if data?
  git.stderr.on "data", (data) ->
    logger.error "stderr:#{data}" if data?
  git.on "exit" ,(code) ->
    logger.info "clone complete..." if code is 0
    logger.debug "child_process_spawn exit with code #{code}"
  

# copy from svn 
copySVN = (from, dest) ->
  args = ["checkout",from ,dest] 
  git = spawn "svn",args
  git.stdout.on "data", (data) ->
    logger.info "stdout:#{data}" if data?
  git.stderr.on "data", (data) ->
    logger.error "stderr:#{data}" if data?
  git.on "exit" ,(code) ->
    logger.info "clone complete..." if code is 0
    logger.debug "child_process_spawn exit with code #{code}"

# copy from local file system
copyDir = (from, dest) ->
  from = sysPath.resolve pwd, from
  ncp from, dest ,(err) ->
    logger.error err if err?


module.exports = (from, dest = pwd) ->
  dest = sysPath.resolve pwd, dest
  return copyGit from,dest if gitReg.test from
  return copySvn from,dest if svnReg.test from
  return copyDir from,dest







