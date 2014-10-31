var browserify = require("browserify"),
  watchify = require('watchify'),
  bundleLog = require('../utilities/bundleLog'),
  gulp = require('gulp'),
  partialify = require("partialify"),
    coffeeify = require("coffeeify"),
  errorHandler = require('../utilities/errorHandler'),
  source = require('vinyl-source-stream');

gulp.task("browserify", function () {

  var bundler = browserify({
    //watchify stuffs
    cache: {},
    packageCache: {},
    fullPaths: true,
    //browserify stuffs
    entries: ['./js/app.coffee'],
    debug: true
  });
/*
  bundler.transform({
    global: true
}, "uglifyify");*/

  var bundle = function () {
    bundleLog.start();

    return bundler
        .transform(partialify)
        .transform({}, coffeeify)
      .bundle()
      .on('error', errorHandler)
      .pipe(source('app.js'))
      .pipe(gulp.dest('../public/'))
      .on('end', bundleLog.end);
  };

  if (global.isWatching) {
    bundler = watchify(bundler);
    bundler.on("update", bundle);
  }

  return bundle();
});
