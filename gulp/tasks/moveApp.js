var gulp = require("gulp");

gulp.task("Moving app", function () {
  return gulp.src("./app.js")
    .pipe(gulp.dest('../public/'));
});