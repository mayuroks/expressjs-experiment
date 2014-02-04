// Generated by CoffeeScript 1.6.3
var ama;

ama = require('../models');

exports.postama = function(req, res) {
  var record;
  record = new ama();
  record.title = req.body.title;
  record.content = req.body.content;
  return record.save(function(err) {
    if (err) {
      return console.log(err);
    } else {
      return res.redirect(301, '/listama');
    }
  });
};

exports.listama = function(req, res) {
  req.session.View = 'List of all AMAs. Enjoy !';
  res.setHeader('Custom-Header', req.session.View);
  return ama.find({}, function(err, results) {
    if (err) {
      return console.log(err);
    } else {
      console.log(results);
      return res.render('index', {
        pop: 'ama',
        entries: results
      });
    }
  });
};

exports.blogform = function(req, res) {
  res.setHeader('Custom-Sexy-Header', req.session.View);
  return res.render('form');
};

exports.detailview = function(req, res) {
  return ama.findOne({
    '_id': req.params.id
  }, function(err, results) {
    if (err) {
      return console.log(err);
    } else {
      console.log(results);
      return res.render('ama', {
        ama: results
      });
    }
  });
};

exports.deleteview = function(req, res) {
  return ama.remove({
    '_id': req.params.id
  }, function(err) {
    if (err) {
      return console.log(err);
    } else {
      return res.send(req.params.id + " Deleted");
    }
  });
};
