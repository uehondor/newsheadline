NewsFeed = require './NewsFeed'

class SkyNewsFeed extends NewsFeed
  list: (maxFeeds)->
    @name = 'Sky News'
    super 'http://news.sky.com/feeds/rss/home.xml', maxFeeds

module.exports = new SkyNewsFeed
