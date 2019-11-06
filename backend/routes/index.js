const routes = require('express').Router();

const users = require('./users');

routes.get('/', (req, res) => {
  res.status(200).json({ message: 'Connected to / !' });
});

routes.use('/users', users);

module.exports = routes;
