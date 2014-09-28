gulp = require 'gulp'

###*
  @param {(string|Array.<string>)} paths
  @param {Object} yargs
  @param {Function} done
###
module.exports = (paths, yargs, done) ->
  bump = require 'gulp-bump'
  path = require 'path'

  args = yargs.alias('m', 'minor').argv
  type = args.major && 'major' || args.minor && 'minor' || 'patch'

  gulp.src paths
    .pipe bump type: type
    .pipe gulp.dest './'
    .on 'end', =>
      done()
  return
