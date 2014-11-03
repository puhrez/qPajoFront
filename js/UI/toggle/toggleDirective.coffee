"use strict"

module.exports = ->
  class ToggleCtrl
    state = "right"
    constructor: (@$scope, @$log) ->
      @right = @$scope.right
      @left = @$scope.left
      @bool = @$scope.ctrl.bool
      @$log.debug "toggle init"
    toggle: (e) ->
      side = e.target.className.split(" ")[0]
      if @state isnt side
        @state = side
        @bool = !@bool
        @$scope.ctrl.switch()
  scope:
    right: "="
    left: "="
    ctrl: "="
  restrict: "E"
  controllerAs: "ToggleCtrl"
  controller: ["$scope", "$log", ($scope, $log) ->
    new ToggleCtrl($scope, $log)
  ]
  template: require "./toggle.html"