var browserSync = require('browser-sync'),
  gulp = require('gulp');

gulp.task('browserSync', ['build'], function () {
  browserSync.init(['../public/**'], {
    server: {
      baseDir: '../public'
    }
  });
});