let Event = require('../../models/event');
let User = require('../../models/user');

const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  // var result = data.users;
  // res.send(result);
  console.log("Inside users");
});

router.post('/', (req, res) => {
  const post = console.log(req.body);
})

module.exports = router;
