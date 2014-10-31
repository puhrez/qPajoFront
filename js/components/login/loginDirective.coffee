"use strict"

module.exports = ->
  class LoginCtrl
    user: {}
    bool: true
    constructor: (@$scope, @$rootScope, @AUTH_EVENTS, @AuthService) ->
      @user =
        username: ""
        password: ""
      @login =
        title: "Login"
        url: "./views/login.html"
      @register =
        title: "Sign-up"
        url: "./views/register.html"
      console.log "login int"
    close: ->
      console.log "close"
      @$scope.app.showLogin = false
    login: (credentials) ->
      @AuthService.login credentials
        .then((user) ->
          @$rootScope.$broadcast @AUTHEVENTS.loginSucess
          @$scope.app.setCurrentUser user
        )
    switch: ->
      @showLogin = !@showLogin
  restrict: "E"
  controllerAs: "LoginCtrl"
  controller: ["$scope", "$rootScope", "AUTH_EVENTS", "AuthService",
    ($scope, $rootScope, AUTH_EVENTS, AuthService) ->
               new LoginCtrl($scope, $rootScope, AUTH_EVENTS, AuthService)
  ]
  template: require "./interface.html"
