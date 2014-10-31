"use strict"

angular = require "angular"

module.exports = angular.module "qpajo.ui", [
  require("./tabset/index.coffee").name
  require("./toggle/index.coffee").name
]