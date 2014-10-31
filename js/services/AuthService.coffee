"use strict"
angular = require "angular"
module.exports = ($http, Session) ->
  new class AuthService
    constructor: () ->
      console.log "auth service init"
    login: (credentials) ->
      $http
        .post("/auth/login", credentials)
        .then((res) ->
          Session.create(res.data.id, res.data.user.id, res.data.user.role)
          res.data.user
        )
    isAuthenticated: ->
      !!Session.userId
    isAuthorized: (authorizedRoles) ->
      if !angular.isArray authorizedRoles
        authorizedRoles = [authorizedRoles]
      @isAuthenticated() and
        authorizedRoles.indexOf Session.userRole isnt -1