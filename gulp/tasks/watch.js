var gulp = require('gulp');

gulp.task('Watch', ['Setting Watch Status', 'browserSync'], function () {
  gulp.watch('./style/**', ['Compiling less']);
  gulp.watch('./assets/img/**', ['Minifying images']);
  gulp.watch('./index.html', ['Moving html']);
  gulp.watch('./views/**', ['Moving views']);
});