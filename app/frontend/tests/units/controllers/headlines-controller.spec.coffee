$httpBackend = null
scope = null
createController = null

describe 'HeadlinesController', ->
  beforeEach window.module 'headlines'

  beforeEach inject ($rootScope, $controller, $injector) ->
    scope = $rootScope
    $httpBackend = $injector.get '$httpBackend'

    createController = ->
      $controller 'HeadlinesController', '$scope': scope

  describe 'load method', ->
    it 'should be called on page load', ->
      headlines =
        _embedded:
          headlines: [ { title: 'Some title' } ]

      $httpBackend.expectGET('/headlines').respond headlines

      createController()

      $httpBackend.flush()

      expect(scope.headlines).toEqual headlines._embedded.headlines
