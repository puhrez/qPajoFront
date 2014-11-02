"use strict"

module.exports = ->
  class LoginCtrl
    user: {}
    bool: false
    constructor: (@$scope, @$rootScope, @AUTH_EVENTS, @AuthService) ->
      @btn =
        message: if @bool then "Login" else "Register"
      @user =
        email: ""
        id: ""
        password: ""
        role: "admin"
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
    submit: ->
      if @showLogin
        @AuthService.login @user
          .then((user) ->
          @$rootScope.$broadcast @AUTH_EVENTS.loginSucess
          @$scope.app.setCurrentUser user
        )
      else
        @AuthService.register @user
      console.log "submit"
    register: (credentials) ->
      @AuthService.register credentials
    login: (credentials) ->
      console.log "hello from login"
      @AuthService.login credentials
        .then((user) ->
          console.log "then", user
          @$rootScope.$broadcast @AUTH_EVENTS.loginSucess
          @$scope.app.setCurrentUser user
        )
    switch: ->
      @bool = !@bool
      @btn.message = if @bool then "Login" else "Register"
  restrict: "E"
  controllerAs: "LoginCtrl"
  controller: ["$scope", "$rootScope", "AUTH_EVENTS", "AuthService",
    ($scope, $rootScope, AUTH_EVENTS, AuthService) ->
              console.log AUTH_EVENTS
              new LoginCtrl($scope, $rootScope, AUTH_EVENTS, AuthService)
  ]
  template: require "./interface.html"
