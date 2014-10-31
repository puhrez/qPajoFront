var gulp = require('gulp');

gulp.task('build', ['browserify', 'Compiling less', 'Minifying images', 'Moving html', 'Moving views']);