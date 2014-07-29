express = require 'express'
swig = require 'swig'

app = express()

myswig = new swig.Swig varControls: ['{{{', '}}}']

app.engine 'html', myswig.renderFile
app.engine 'json', myswig.renderFile

app.set 'view engine', 'html'
app.set 'views', "#{__dirname}/server/views"
app.use express.static(__dirname + '/frontend/assets')

app.get '/', require('./server/controllers/index').index
app.get '/headlines', require('./server/controllers/headlines').list
app.use require('./server/controllers/errors').four0four

app.listen 3000

module.exports = app
