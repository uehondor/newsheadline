NewsFeed = require './NewsFeed'

class BBCNewsFeed extends NewsFeed
  list: (maxFeeds)->
    @name = 'BBC News'
    super 'http://feeds.bbci.co.uk/news/rss.xml', maxFeeds

module.exports = new BBCNewsFeed()
