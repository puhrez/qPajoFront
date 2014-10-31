var gulp = require("gulp"),
  csso = require("gulp-csso");

gulp.task('Minifying css', function () {
  return gulp.src("../public/stylesheets/**")
    .pipe(csso())
    .pipe(gulp.dest('../public/stylesheets'));
});