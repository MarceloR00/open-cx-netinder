'use strict';

require('dotenv/config');

const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const OPTS = { useUnifiedTopology: true, useNewUrlParser: true };
const express = require('express');
const app = express();
const usersRoute = require('./routes/posts/users');
const cors = require('cors');
const PORT = 8080;
const HOST = '0.0.0.0';

// Middlewares
app.use(bodyParser.json());
app.use('/posts/users', usersRoute);
app.use(cors());

// Get request
app.get('/', (req, res) => {
  res.send("Root directory\n");
});

// Connects app to a MongoDB database
console.log(process.env.DB_CONNECTION);
console.log(OPTS);
mongoose.connect(process.env.DB_CONNECTION, OPTS);
mongoose.connection.on("connected", () => {
  console.log("Connected to database");
});
mongoose.connection.on("error", (err) => {
  console.log("Connection to database failed: ", err);
})

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
