# Contains routes functions (Django views) for our ama blog
ama = require '../models'	# defined collection ama using model

exports.postama = (req, res) ->
	record = new ama()
	record.title = req.body.title
	record.content = req.body.content

	record.save (err) ->
		if err
			console.log(err)
		else
			res.redirect(301,'/listama')
			# res.json(req.body)
	# res.send("SAVED " + req.body.title)
	# LOTS of code to be written
	# to save title,body,posted_on, by, published etc
	
exports.listama = (req, res) ->
	ama.find {}, (err, results) ->
		if err then console.log err
		else 
			console.log results
			# res.send(results)
			res.render('index', {pop: 'ama', entries: results})
			# RENDER FORMAT ('template_name', {key: value_params_to_b_displayed})

exports.blogform = (req, res) ->
	# FORM for a new blog entry
	res.render('form')

exports.detailview = (req, res) ->
	ama.findOne {'_id': req.params.id}, (err, results) ->
		if err then return console.log err
		else
			console.log results
			res.render('ama', {ama: results})
			# res.json(results)

exports.deleteview = (req, res) ->
	ama.remove {'_id': req.params.id }, (err) ->
		if err then return console.log err
		else
			res.send(req.params.id + " Deleted")
		# product.findById req.body.id, (err, product) ->
		# 	console.log product
