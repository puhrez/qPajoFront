var gulp = require("gulp");

gulp.task("Moving views", function () {
  return gulp.src("./views/**")
    .pipe(gulp.dest('../public/views'));
});