(function() {
  var FeedParser, NewsFeed, http, q;

  q = require('q');

  FeedParser = require('feedparser');

  http = require('http');

  NewsFeed = (function() {
    function NewsFeed(name) {
      this.name = name;
    }

    NewsFeed.prototype.list = function(url, maxFeeds) {
      var deferred, feedMeta, items;
      feedMeta = null;
      items = [];
      deferred = q.defer();
      http.get(url, (function(_this) {
        return function(res) {
          return res.pipe(new FeedParser({})).on('meta', function(meta) {
            return feedMeta = meta;
          }).on('readable', function() {
            var item, stream, _results;
            stream = this;
            item = null;
            _results = [];
            while (item = stream.read()) {
              if (maxFeeds === 0) {
                break;
              }
              items.push({
                title: item.title,
                description: item.description,
                url: item.link,
                datePublished: item.pubDate.toISOString(),
                image: item.image
              });
              _results.push(maxFeeds--);
            }
            return _results;
          }).on('end', function() {
            return deferred.resolve({
              name: _this.name,
              website: feedMeta.link,
              items: items
            });
          });
        };
      })(this));
      return deferred.promise;
    };

    return NewsFeed;

  })();

  module.exports = NewsFeed;

}).call(this);
