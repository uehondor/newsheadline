newsAggregator = require './../utils/NewsAggregator'

exports.list = (req, res, next)->
  res.set 'Content-Type', 'application/json'

  newsAggregator.list()
  .then (news)->
    res.render 'api/headlines.json',
      headlines: news
