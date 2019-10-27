'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

var data = {
  users : [
    {
      "id": 1,
      "name": "Mark Meehan",
      "tags": [
        "Backend",
        "DevOps",
      ],
      "degree": "Software Engineering"    },

    {
      "id": 2,
      "name": "Carlos Nova",
      "tags": [
        "Backend",
        "DevOps",
      ],
      "degree": "Software Engineering"    }
  ]
}


var result = data.users;

// App
const app = express();

app.get('/', (req, res) => {
  res.send("Root directory\n");
});

app.get('/users', (req, res) => {
  res.send(result);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);