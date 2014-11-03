var gulp = require("gulp"),
  browserify = require("gulp-browserify"),  
  errorHandler = require('../utilities/errorHandler'),
  rename = require("gulp-rename");
gulp.task("browserify", function () {
    gulp.src("./js/app.coffee", {read: false})
      .pipe(browserify({
        transform: ["coffeeify", "partialify"],
        extensions: [".coffee", ".html"]
    }))
      .on('error', errorHandler)
      .pipe(rename('app.js'))
      .pipe(gulp.dest('./js'));
});
