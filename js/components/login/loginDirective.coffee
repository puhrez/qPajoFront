"use strict"

module.exports = ->
  class LoginCtrl
    user: {}
    bool: false
    constructor: (@$scope,
                  @$rootScope,
                  @AUTH_EVENTS,
                  @AuthService,
                  @$location, @$log) ->
      @bool = $location.path() is "/login"
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
      @$log.debug "login int"
    close: ->
      @$log.debug "close"
      @$scope.app.showLogin = false
    submit: ->
      if @bool
        @AuthService.login @user
          .then((user) ->
          @$rootScope.$broadcast @AUTH_EVENTS.loginSucess
          @$scope.app.setCurrentUser user
        )
      else
        @AuthService.register @user
      @$log.debug "submit"
    register: (credentials) ->
      @$log.debug "bool on reg", @bool
      @AuthService.register credentials
    login: (credentials) ->
      @$log.debug "hello from login"
      @AuthService.login credentials
        .then((user) ->
          @$log.debug "then", user
          @$rootScope.$broadcast @AUTH_EVENTS.loginSucess
          @$scope.app.setCurrentUser user
        )
    switch: ->
      @bool = !@bool
      @btn.message = if @bool then "Login" else "Register"
      @$log.debug "bool is now", @bool
  restrict: "E"
  controllerAs: "LoginCtrl"
  controller: ["$scope",
               "$rootScope", "AUTH_EVENTS",
    "AuthService",
    "$location", "$log",
    ($scope, $rootScope, AUTH_EVENTS, AuthService, $location, $log) ->
              new LoginCtrl($scope,
                            $rootScope,
                            AUTH_EVENTS,
                            AuthService,
                            $location, $log)
  ]
  template: require "./interface.html"
