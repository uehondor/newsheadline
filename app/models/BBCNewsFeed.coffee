NewsFeed = require './NewsFeed'

class BBCNewsFeed extends NewsFeed
  list: ->
    super 'http://feeds.bbci.co.uk/news/rss.xml'

module.exports = new BBCNewsFeed()
