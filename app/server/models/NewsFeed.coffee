q = require 'q'
FeedParser = require 'feedparser'
http = require 'http'

class NewsFeed
  constructor: (@name) ->
  list: (url, maxFeeds) ->
    feedMeta = null
    items = []
    deferred = q.defer()

    http.get url, (res) =>
      res.pipe new FeedParser {}

      .on 'meta', (meta)->
        feedMeta = meta

      .on 'readable', ->
        stream = this
        item = null

        while item = stream.read()
          if maxFeeds == 0
            break

          items.push
            title: item.title
            description: item.description
            url: item.link
            datePublished: item.pubDate.toISOString()
            image: item.image

          maxFeeds--

      .on 'end', =>
        deferred.resolve
          name: @name,
          website: feedMeta.link
          items: items

      .on 'error', (error) ->
        deferred.reject error

    return deferred.promise

module.exports = NewsFeed
