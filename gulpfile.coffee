"use strict"

gulp    = require "gulp"
coffee  = require "gulp-coffee"
concat  = require "gulp-concat"
connect = require "gulp-connect"
header  = require "gulp-header"
uglify  = require "gulp-uglify"
gutil   = require "gulp-util"
stylus  = require "gulp-stylus"
pkg     = require "./package.json"

source  =
  coffee : [ "source/*.coffee"]
  stylus : [ "source/*.styl"]
  bower : "dist/"

banner = [
  "/**"
  " * <%= pkg.name %> - <%= pkg.description %>"
  " * @version v<%= pkg.version %>"
  " * @link    <%= pkg.homepage %>"
  " * @author  <%= pkg.author.name %> (<%= pkg.author.site %>)"
  " * @license <%= pkg.license %>"
  " */"
  ""
].join("\n")

gulp.task "webserver", ->
  connect.server
    port      : 8000
    livereload: true

"use strict"

gulp.task "coffee", ->
  gulp.src source.coffee
    .pipe concat "flexo.site.profile.coffee"
    .pipe coffee().on("error", gutil.log)
    .pipe uglify mangle: false
    .pipe header banner, pkg: pkg
    .pipe gulp.dest source.bower
    .pipe connect.reload()

gulp.task "stylus", ->
  gulp.src source.stylus
    .pipe concat "flexo.site.profile.styl"
    .pipe stylus
      compress: true
      errors  : true
    .pipe header banner, pkg: pkg
    .pipe gulp.dest source.bower
    .pipe connect.reload()

gulp.task "init", ["coffee", "stylus"]

gulp.task "default", ->
  gulp.run ["webserver"]
  gulp.watch source.coffee, ["coffee"]
  gulp.watch source.stylus, ["stylus"]
