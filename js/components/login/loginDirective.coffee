"use strict"

module.exports = ->
  class LoginCtrl
    user: {}
    bool: false
    constructor: (@$scope,
                  @$rootScope,
                  @AUTH_EVENTS,
                  @AuthService,
                  @$location,
                  @$log, @$timeout) ->
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
        message: "Registration Successful"
      @$log.debug "login int blue"
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
          @clear()
          @close()
        )
    register: (creds) ->
      @$log.debug "hello from reg"
      @AuthService.register @user
        .then((res) =>
          @$log.debug "register hit true"
          @registerView.success = true
          @clear()
          @$timeout(() =>
            @registerView.success = false
          ,1000)
        )
    submit: (user) ->
      if @bool
        @login user
      else
        @register user
      @$log.debug "submit"
    switch: ->
      @bool = !@bool
      @btn.message = if @bool then "Login" else "Register"
      @$log.debug "bool is now", @bool
    clear: ->
      @user.email = ""
      @user.password = ""
      @user.id = ""
  restrict: "E"
  controllerAs: "LoginCtrl"
  controller: ["$scope",
               "$rootScope", "AUTH_EVENTS",
    "AuthService",
    "$location", "$log", "$timeout",
    ($scope, $rootScope, AUTH_EVENTS, AuthService, $location, $log, $timeout) ->
              new LoginCtrl($scope,
                            $rootScope,
                            AUTH_EVENTS,
                            AuthService,
                            $location, $log, $timeout)
  ]
  template: require "./interface.html"
