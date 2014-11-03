"use strict"

angular = require "angular"

module.exports = angular.module "qpajo.components", [
  require("./header/index.coffee").name
  require("./login/index.coffee").name
]
