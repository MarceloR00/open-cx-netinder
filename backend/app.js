'use strict';

require('dotenv/config');

const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const OPTS = { useUnifiedTopology: true, useNewUrlParser: true };
const express = require('express');
const app = express();
const usersRoute = require('./routes/posts/users');
const eventsRoute = require('./routes/posts/events');
const cors = require('cors');
const PORT = 8080;
const HOST = '0.0.0.0';

// Middlewares
app.use('/admin', require('./admin'))
app.use(bodyParser.json());
app.use('/posts/users', usersRoute);
app.use('/posts/events', eventsRoute);
app.use(cors());

// Get request
app.get('/', (req, res) => {
  res.send("Root directory\n");
});

// Connects app to a MongoDB database
mongoose.connect(process.env.DB_CONNECTION, OPTS, () => { console.log("Connected to database") });

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
