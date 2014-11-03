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
      @loginView =
        title: "Login"
        url: "./views/login.html"
      @registerView =
        title: "Sign-up"
        url: "./views/register.html"
      @$log.debug "login int"
    close: ->
      @$log.debug "close"
      @$scope.app.showLogin = false
    login: (credentials) ->
      @$log.debug "hello from login"
      @AuthService.login credentials
        .then((user) =>
          @$rootScope.$broadcast @AUTH_EVENTS.loginSuccess
          @$scope.app.setCurrentUser user
          @$log.debug "is authed", @AuthService.isAuthenticated()
          @close()
        )
    submit: ->
      if @bool
        @login @user
      else
        @AuthService.register @user
      @$log.debug "submit"
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
