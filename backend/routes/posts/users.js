const tokenMiddleware =require('../../middleware/middleware');
let Event = require('../../models/event');
let User = require('../../models/user');
const generateJWTUser = require('../../utils/hash');
const confirmPassword = require('../../utils/hash');

const express = require('express');
const router = express.Router();

router.use(tokenMiddleware);

//registerUser
router.post('/register',async(req,res) =>{
  console.log(req.body);
  try{

   
    const user = new User({
      username: req.body.username,
      password: req.body.password,
      age: req.body.age,
      birthPlace: req.body.birthPlace
    });
    const savedPost = await user.save();
    res.json(savedPost);
  }
  catch (err) {
    res.json({ message: err })
  }
});

//loginUser
router.post('/login',async(req,res) =>{
  try{
    const user = await User.findOne({username: new RegExp('^'+req.body.username+'$', "i")}, function(err, user) {
     if (err)
     res.json({ message: "username does not exist" });
     else if(confirmPassword(req.body.password,user.password)){
      let token=generateJWTUser(user.username, user.age,user.birthPlace);
      res.json({loginToken: token});
     }
     else{
      res.json({ message: "wrong password" });
     }
    });
  }
  catch (err) {
    res.json({ message: err })
  }
})

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
