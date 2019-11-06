let User = require('../../models/user');

const singleUser = require('express').Router();

singleUser.get('/:userId', (req, res) => {
  res.send("Get request on /users/id");
});

singleUser.post('/:userId', (req, res) => {
  res.send(req.params);
});

module.exports = singleUser;

