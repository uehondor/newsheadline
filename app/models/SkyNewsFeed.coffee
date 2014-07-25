NewsFeed = require './NewsFeed'

class SkyNewsFeed extends NewsFeed
  list: ->
    super 'http://news.sky.com/feeds/rss/home.xml'

module.exports = new SkyNewsFeed
