module.exports = ($httpBackend) ->
  console.log "hitting register post"
  users = []
  session = 0
  $httpBackend.whenPOST("/auth/register").respond((method, url, data) ->
    console.log "hitting register post"
    user = angular.fromJson data
    users.push user
    [
      200,
      user
      {}
    ]
  )
  $httpBackend.whenPOST("/auth/login").respond((method, url, data) ->
    console.log "hitting login post"
    creds = angular.fromJson data
    successData =
      data:
        id: session += 1
        user: creds
    console.log "successData", successData
    return successData for user in users when creds is user
    return 400
  )
  $httpBackend.whenGET(/^\/views\//).passThrough()