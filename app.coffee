
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
blog = require("./routes/blog")
swig = require("swig")

# var user = require('./routes/user');
http = require("http")
path = require("path")
app = express()

# REDIS SETTINGS
RedisStore = require("connect-redis")(express)

# var hbs = require('hbs');
# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "html"
app.set "view cache", false

# To disable Swig's cache, do the following:
swig.setDefaults cache: false

# app.engine('html', hbs.__express);
app.engine "html", swig.renderFile
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.session({
	# store: new RedisStore({
	# 	host: 'localhost'
	# 	port: 6379
	# 	db: 2
	# 	# pass: 'RedisPass'
	# 	}),
secret: "h3ll0w0rld is the new shit"
	})
app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index

# app.get('/users', user.list);
app.get "/listama", blog.listama
app.get "/blogform", blog.blogform # USER INPUT
app.post "/postama", blog.postama # FORM PROCESSING
app.get "/ama/:id", blog.detailview
app.get "/delete/:id", blog.deleteview # DELETEVIEW using GET
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  return

