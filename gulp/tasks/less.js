var less = require('gulp-less'),
  gulp = require('gulp'),
  changed = require('gulp-changed'),
  errorHandler = require("../utilities/errorHandler");

gulp.task('Compiling less', ['Minifying images'], function () {
  var dest = "../public/stylesheets",
    src = "./style/main.less";

  return gulp.src(src)
    .pipe(changed(dest))
    .pipe(less())
    .on("error", errorHandler)
    .pipe(gulp.dest(dest));
});