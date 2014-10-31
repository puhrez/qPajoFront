module.exports = ($routeProvider) ->
  console.log "route init"
  $routeProvider.when "/",
    template: require "./containers/front/front.html"
    controller: require "./containers/front/frontCtrl.coffee"