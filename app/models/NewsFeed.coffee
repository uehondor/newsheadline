q = require 'q'
FeedParser = require 'feedparser'
http = require 'http'

class NewsFeed
  constructor: ()->

  list: (url)->
    feedMeta = null
    items = []
    deferred = q.defer()

    http.get url, (res)->
      res.pipe new FeedParser {}

      .on 'meta', (meta)->
        feedMeta = meta

      .on 'readable', ->
        stream = this
        item = null

        while item = stream.read()
          items.push
            title: item.title
            description: item.description
            url: item.link
            datePublished: item.pubDate
            image: item.image

      .on 'end', ->
        deferred.resolve
          name: feedMeta.title,
          website: feedMeta.link
          items: items

    return deferred.promise

module.exports = NewsFeed
