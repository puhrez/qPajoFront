var gulp = require("gulp");

gulp.task("Moving html", function () {
  return gulp.src("./index.html")
    .pipe(gulp.dest('../public/'));
});