mongoose = require 'mongoose'
mongoose.connect ''	# Isnt specified yet
db = mongoose.connection
db.on('error', console.error.bind(console, 'connection error:'))

# db.once 'open', () ->
# 	console.log "yess connection successful"

# Model for post
module.exports = mongoose.model 'Ama', {
	title: String
	content: String
	posted_on: new Date()
	posted_by: String
	votes: Number
	published: Boolean
	comments: Number
}

# Model for comments