let Event = require('../../models/event');

const events = require('express').Router();

const all = require('./all');
const single = require('./single');

events.get('/', all);
events.post('/', all);

events.get('/:userId', single);
events.post('/:userId', single);

module.exports = events;
