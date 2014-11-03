"use strict"
angular = require "angular"
module.exports = ["$http","SessionService", "$log",($http, Session, $log) ->
  new class AuthService
    constructor: () ->
      $log.debug "auth service init"
      @users = []
    register: (credentials) ->
      console.log "registering", credentials
      $http
        .post("/auth/register", credentials)
        .then(() ->
          true
        )
    login: (credentials) ->
      $log.debug "logging in"
      return $http
        .post("/auth/login", credentials)
        .then((res) ->
          $log.debug "responce", res
          Session.create(res.data.id, res.data.user.id, res.data.user.role)
          return res.data.user
        )
    isAuthenticated: ->
      !!Session.userId
    isAuthorized: (authorizedRoles) ->
      if !angular.isArray authorizedRoles
        authorizedRoles = [authorizedRoles]
      @isAuthenticated() and
        authorizedRoles.indexOf Session.userRole isnt -1
]