const routes = require('express').Router();

const users = require('./users');
const events = require('./events');

routes.get('/', (req, res) => {
  res.status(200).json({ message: 'Connected to / !' });
});

routes.use('/users', users);
routes.use('/events', events);

module.exports = routes;
