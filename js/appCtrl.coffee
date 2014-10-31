module.exports = ($scope, USER_ROLES, AuthService) ->
  console.log "app init"
  $scope.app =
    currentUser: null
    userRoles: USER_ROLES
    isAuthorized: AuthService.isAuthorized
    setCurrentUser: (user) ->
      @currentUser = user
