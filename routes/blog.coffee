# Contains routes functions (Django views) for our ama blog
ama = require '../model'	# defined collection ama using model

exports.postama = (req, res) ->
	recored = new ama()
	# LOTS of code to be written
	# to save title,body,posted_on, by, published etc
	# need a form for this stuff
	
exports.listama = (req, res) ->
	ama.find {}, (err, results) ->
		if err then console.log err
		else 
			console.log results
			res.send(results)


exports.detailama
