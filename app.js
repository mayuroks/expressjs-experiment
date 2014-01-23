
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var blog = require('./routes/blog');
var swig = require('swig')
// var user = require('./routes/user');
var http = require('http');
var path = require('path');

var app = express();
var hbs = require('hbs');
// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'html');
app.set('view cache', false);
// To disable Swig's cache, do the following:
swig.setDefaults({ cache: false });
// app.engine('html', hbs.__express);
app.engine('html', swig.renderFile);
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);
// app.get('/users', user.list);

app.get('/listama', blog.listama);
app.get('/blogform', blog.blogform);	// USER INPUT
app.post('/postama', blog.postama);		// FORM PROCESSING
app.get('/ama/:id', blog.detailview);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
