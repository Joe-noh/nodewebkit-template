gulp   = require "gulp"
gutil  = require "gulp-util"
cond   = require "gulp-if"
coffee = require "gulp-coffee"
stylus = require "gulp-stylus"
jade   = require "gulp-jade"
rimraf = require "gulp-rimraf"
uglify = require "gulp-uglify"
minify = require "gulp-minify-css"

isRelease = gutil.env.release?

gulp.task "default", ["clean", "build"]

gulp.task "build", ["coffee", "stylus", "jade"]

gulp.task "coffee", ->
  gulp.src("./src/js/**/*.coffee")
      .pipe(coffee())
      .pipe(cond isRelease, uglify())
      .pipe(gulp.dest "./build/js/")

gulp.task "stylus", ->
  gulp.src("./src/css/**/*.styl")
      .pipe(stylus())
      .pipe(cond isRelease, minify())
      .pipe(gulp.dest "./build/css/")

gulp.task "jade", ->
  gulp.src("./src/html/**/*.jade")
      .pipe(jade())
      .pipe(gulp.dest "./build/html/")

gulp.task "clean", (cb) ->
  rimraf("./build", cb)

