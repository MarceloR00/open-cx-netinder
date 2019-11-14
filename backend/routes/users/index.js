let User = require('../../models/user');

const users = require('express').Router();

const all = require('./all');
const single = require('./single');

users.get('/', all);
users.post('/', all);

users.get('/:userId', single);
users.post('/:userId', single);

module.exports = users;
