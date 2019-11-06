'use strict';

require('dotenv/config');

const mongoose = require('mongoose');
const OPTS = { useUnifiedTopology: true, useNewUrlParser: true };

const express = require('express');
const app = express();
const PORT = 8080;
const HOST = '0.0.0.0';

const cors = require('cors');
const routes = require('./routes');

// Connects app to a MongoDB database
mongoose.connect(process.env.DB_CONNECTION, OPTS);

mongoose.connection.on("connected", () => {
  console.log("Connected to database");
});
mongoose.connection.on("error", (err) => {
  console.err("Connection to database failed: ", err);
})


//  Connect all our routes to our application
app.use(cors());
app.use('/', routes);


app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
