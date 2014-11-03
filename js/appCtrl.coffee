module.exports = ["$scope","USER_ROLES", "AuthService", "$location","$log",
($scope, USER_ROLES, AuthService, $location, $log) ->
  $log.debug "app init"
  $scope.app =
    showLogin: $location.path() is "/login" or $location.path() is "/register"
    currentUser: null
    userRoles: USER_ROLES
    isAuthorized: AuthService.isAuthorized
    setCurrentUser: (user) ->
      @currentUser = user
]
