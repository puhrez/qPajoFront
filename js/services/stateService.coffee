"use strict"
angular = require "angular"
module.exports =
  ($location) ->
    unwatch = (watchers, cb) ->
      ->
        i = watchers.indexOf cb
        if i == -1
          return
        watchers.splice i, 1
    checkKey = (state, key) ->
      throw new Error 'State: no key "' + key +
        '" in map.' if key not of state.vals
    new class State
      constructor (opts) ->
        @vals = {}
        @watchers = []
        
        for key, opt of opts
          @createState key, opt
      
      createState: (key, opt={}) ->
        if "url" not of opt
          opt.url = true
          
        @vals[key] =
          val: $location.search() [key] || opt.default
          watchers: []
          
        $location.search key, @vals[key] if opt.url
        
        Object.defineProperty @, key,
          enumerable: true
          configurable: true
          get: =>
            @vals[key].val
          set: (val) =>
            if Array.isArray val
              val = val.join ","
            
            $location.search key, val if opt.url
            watcher(val, @vals[key].val, key) for watcher in @vals[key].watchers
            watcher(val, @vals[key].val, key) for watcher in @watchers
            
            @vals[key] = val
          @vals[key].val
          
        removeState: (key, notify = true) ->
          checkKey @, key
          $location.search key, undefined if notify
          delete @[key]
          delete @vals[key]
          
        watch: (key, cb) ->
          checkKey @, key
          @vals[key].watchers.push cb
          cb(@vals[key].val, @vals[key].val, key)
          unwatch @vals[key].watchers, cb
          
        watchAll: (cb) ->
          @watchers.push cb
          cb(@vals[key].val, @vals[key].val, key) for key of @vals
          unwatch @watchers, cb
          
        new: (opts) ->
          new State(opts)
    
      
