q = require 'q'
bbcNewsFeed = require './../models/BBCNewsFeed'
skyNewsFeed = require './../models/SkyNewsFeed'

exports.list = (maxPerFeed = 10)->
  deferred = q.defer()
  news = []

  q.all [ bbcNewsFeed.list(), skyNewsFeed.list() ]
  .then (feeds)->
    for feed in feeds
      news.push updateItemWithFeedInfo(feed, item) for item in feed.items
    deferred.resolve(news)

  return deferred.promise

updateItemWithFeedInfo = (feed, item)->
  item.source = feed.name
  item.website = feed.website

  return item

exports.list()
