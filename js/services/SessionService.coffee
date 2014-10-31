module.exports = () ->
  new class Session
    constructor: ->
      console.log "session init"
    create: (sessionId, userId, userRole) ->
      @id = sessionId
      @userId = userId
      @userRole = userRole
    destroy: ->
      @id = null
      @userId = null
      @userRole = null