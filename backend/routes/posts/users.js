let User = require('../../models/user');

const express = require('express');
const router = express.Router();

// Gets all of the users
router.get('/', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  }
  catch (err) {
    res.json({ message: err })
  }
});

// Gets all of a specific user's info from the database
router.get('/:postId', async (req, res) => {
  try {
    const user = await User.findById(req.params.postId);
    res.json(user);
  }
  catch (err) {
    res.json({ message: err });
  }
})

// Delete user from database
router.delete('/:postId', async (req, res) => {
  try {
    const removedPost = await User.remove({ _id: req.params.postId });
    res.json(removedPost);
  }
  catch (err) {
    res.json({ message: err });
  }
});

// Adds a user to the database
router.post('/', async (req, res) => {
  const user = new User({
    username: req.body.username,
    password: req.body.password,
    age: req.body.age,
    birthPlace: req.body.birthPlace,
    description: req.body.description,
    tags: req.body.tags,
    conferences: req.body.conferences,
    points: req.body.points,
    matches: req.body.matches,
    eventsAttended: req.body.eventsAttended
  });

  try {
    const savedPost = await user.save();
    res.json(savedPost);
  }
  catch (err) {
    res.json({ message: err });
  }

});

module.exports = router;