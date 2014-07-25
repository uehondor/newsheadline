class HeadlinesController
  @$inject: ['$scope', '$http']
  constructor: (@scope, @http) ->
    @scope.headlines = []

    @scope.load = =>
      @http.get '/headlines'
      .success (data)=>
        @scope.headlines = data._embedded.headlines

    @scope.load()

module.exports = (newsHeadlineModule) ->
  newsHeadlineModule.controller 'HeadlinesController', HeadlinesController
