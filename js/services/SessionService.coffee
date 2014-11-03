module.exports = ["$log", ($log) ->
  new class Session
    constructor: ->
      $log.debug "session init"
    create: (sessionId, userId, userRole) ->
      @id = sessionId
      @userId = userId
      @userRole = userRole
    destroy: ->
      @id = null
      @userId = null
      @userRole = null
]