const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
  username: {
    type: String,
    required: true
  },
  password: {
    type: String,
    required: true
  },
  age: {
    type: Number,
    min: 13,
    max: 90,
    required: true
  },
  description: String,
  tags: [String],
  conferences: [String],
  points: {
    type: Number,
    min: 0
  },
  matches: [String],
  eventsAttended: [String]
});

module.exports = mongoose.model('User', userSchema);
