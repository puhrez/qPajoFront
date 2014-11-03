module.exports = ["$scope","USER_ROLES", "AuthService", "$location","$log",
($scope, USER_ROLES, AuthService, $location, $log) ->
  $log.debug "app init"
  $log.debug "authed?", AuthService.isAuthenticated()
  $scope.app =
    showLogin: $location.path() is "/login" or $location.path() is "/register"
    currentUser: null
    userRoles: USER_ROLES
    isAuthenticated: AuthService.isAuthenticated
    isAuthorized: AuthService.isAuthorized
    setCurrentUser: (user) ->
      @currentUser = user
]
