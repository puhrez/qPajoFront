var gulp = require('gulp');

gulp.task('Watch', ['Setting Watch Status', 'browserSync'], function () {
  gulp.watch("./js/**/*.coffee", ["browserify", "Moving app"]);
  gulp.watch("./js/**/*.html", ["browserify", "Moving app"]);
  gulp.watch('./style/*.less', ['Compiling less']);
  gulp.watch('./assets/img/*.png', ['Minifying images']);
  gulp.watch('./index.html', ['Moving html']);
  gulp.watch('./views/*.html', ['Moving views']);
});