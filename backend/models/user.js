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
    required: true,
    min: 13,
    max: 90
  },
  birthPlace: {
    type: String,
    required: true
  },
  description: String,
  tags: [String],
  conferences: [String],
  points: {
    type: Number,
    min: 0
  },
  matches: [mongoose.Schema.ObjectId],
  eventsAttended: [{ type: mongoose.Schema.ObjectId, ref: 'Event' }]
});

module.exports = mongoose.model('User', userSchema);
