var gulp = require('gulp');

gulp.task('build', ['browserify', "Moving app", 'Compiling less', 'Minifying images', 'Moving html', 'Moving views']);