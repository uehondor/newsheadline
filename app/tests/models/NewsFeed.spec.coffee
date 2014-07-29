NewsFeed = require '../../models/NewsFeed.coffee'

describe 'NewFeed', ->
  it 'should load 10 news headlines', ->
    newsFeed = new NewsFeed 'Test News'
    url = 'http://test.co'

    promise = newsFeed.list(url, 10);
