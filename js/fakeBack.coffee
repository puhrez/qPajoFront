module.exports = ($httpBackend, $log) ->
  $log.debug "backend init"
  users = []
  session = 0
  $httpBackend.whenPOST("/auth/register").respond((method, url, data) ->
    $log.debug "hitting register post"
    user = angular.fromJson data
    users.push user
    [
      200,
      user
      {}
    ]
  )
  $httpBackend.whenGET(/S*\.html$/).passThrough()
  $httpBackend.whenPOST("/auth/login").respond((method, url, data) ->
    $log.debug "hitting login post"
    creds = angular.fromJson data
    successData =
      data:
        id: session += 1
        user: creds
    $log.debug "successData", successData
    return successData for user in users when creds is user
    return 400
  )
