(function() {
  var BBCNewsFeed, NewsFeed,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  NewsFeed = require('./NewsFeed');

  BBCNewsFeed = (function(_super) {
    __extends(BBCNewsFeed, _super);

    function BBCNewsFeed() {
      return BBCNewsFeed.__super__.constructor.apply(this, arguments);
    }

    BBCNewsFeed.prototype.list = function(maxFeeds) {
      this.name = 'BBC News';
      return BBCNewsFeed.__super__.list.call(this, 'http://feeds.bbci.co.uk/news/rss.xml', maxFeeds);
    };

    return BBCNewsFeed;

  })(NewsFeed);

  module.exports = new BBCNewsFeed();

}).call(this);
