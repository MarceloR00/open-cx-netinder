let User = require('../../models/user');

const allUsers = require('express').Router();

allUsers.get('/', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  }
  catch (err) {
    res.json({ message: err })
  }
});

allUsers.post('/', (req, res) => {
  res.send("Post on all users");
});

module.exports = allUsers;
