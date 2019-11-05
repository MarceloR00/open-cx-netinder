'use strict';

require('dotenv/config');

const mongoose = require('mongoose');
const OPTS = { useUnifiedTopology: true, useNewUrlParser: true };

const express = require('express');
const app = express();
const usersRoute = require('./routes/posts/userPosts');
const PORT = 8080;
const HOST = '0.0.0.0';

app.use('/posts/userPosts', usersRoute);

app.get('/', (req, res) => {
  res.send("Root directory\n");
});

mongoose.connect(process.env.DB_CONNECTION, OPTS, () => console.log('Connected to DB.'));

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
