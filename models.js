// Generated by CoffeeScript 1.6.3
var db, mongoose;

mongoose = require('mongoose');

mongoose.connect('');

db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error:'));

module.exports = mongoose.model('Ama', {
  title: String,
  content: String,
  posted_on: new Date(),
  posted_by: String,
  votes: Number,
  published: Boolean,
  comments: Number
});