(function() {
  var NewsFeed, SkyNewsFeed,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  NewsFeed = require('./NewsFeed');

  SkyNewsFeed = (function(_super) {
    __extends(SkyNewsFeed, _super);

    function SkyNewsFeed() {
      return SkyNewsFeed.__super__.constructor.apply(this, arguments);
    }

    SkyNewsFeed.prototype.list = function(maxFeeds) {
      this.name = 'Sky News';
      return SkyNewsFeed.__super__.list.call(this, 'http://news.sky.com/feeds/rss/home.xml', maxFeeds);
    };

    return SkyNewsFeed;

  })(NewsFeed);

  module.exports = new SkyNewsFeed;

}).call(this);
