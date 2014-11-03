module.exports = ($httpBackend, $log) ->
  $log.debug "backend init"
  users = [
    {
      email: "michaelp193@gmail.com",
      id: "test", password: "pie",
      role: "admin"
    }
  ]
  session = 0
  $httpBackend.whenPOST "/auth/register"
    .respond (method, url, data) ->
      $log.debug "hitting register post"
      user = angular.fromJson data
      users.push user
      [200, user, {}]
  $httpBackend.whenGET /S*\.html$/
    .passThrough()
  $httpBackend.whenPOST "/auth/login"
    .respond (method, url, data) ->
      response = [404, {message: "Password or User not correct"}, {}]
      $log.debug "hitting login post"
      creds = angular.fromJson data
      $log.debug "creds are", creds
      successData =
        id: session += 1
        user: creds
      for user in users
        $log.debug "user is", user
        if creds.id is user.id and creds.password is user.password
          response = [200, successData, {}]
          $log.debug "SUCCEESS!", successData
          return response
      response