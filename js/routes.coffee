module.exports = ($routeProvider) ->
  #$log "route init"
  $routeProvider.when "/",
    template: require "./containers/front/front.html"
    controller: require "./containers/front/frontCtrl.coffee"
    $routeProvider.when "/login",
    template: require "./containers/front/front.html"
    controller: require "./containers/front/frontCtrl.coffee"
    $routeProvider.when "/register",
    template: require "./containers/front/front.html"
    controller: require "./containers/front/frontCtrl.coffee"
