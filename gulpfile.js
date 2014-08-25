var gulp   = require("gulp");
var coffee = require("gulp-coffee");
var stylus = require("gulp-stylus");
var jade   = require("gulp-jade");
var rimraf = require("gulp-rimraf");

gulp.task("default", ["clean", "build"]);

gulp.task("build", ["coffee", "stylus", "jade"]);

gulp.task("coffee", function () {
  gulp.src("./src/js/**/*.coffee")
      .pipe(coffee())
      .pipe(gulp.dest("./build/js/"));
});

gulp.task("stylus", function () {
  gulp.src("./src/css/**/*.styl")
      .pipe(stylus())
      .pipe(gulp.dest("./build/css/"));
});

gulp.task("jade", function () {
  gulp.src("./src/html/**/*.jade")
      .pipe(jade())
      .pipe(gulp.dest("./build/html/"));
});

gulp.task("clean", function (cb) {
  rimraf("./build", cb);
});
