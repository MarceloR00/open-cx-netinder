const express = require('express');

const router = express.Router();


var data = {
    users : [
      {
        "id": 1,
        "name": "Mark Meehan",
        "tags": [
          "Backend",
          "DevOps",
        ],
        "degree": "Software Engineering"    
      },
  
      {
        "id": 2,
        "name": "Carlos Nova",
        "tags": [
          "Backend",
          "DevOps",
        ],
        "degree": "Software Engineering"    
      }
    ]
  }

router.get('/', (req, res) => {
    var result = data.users;
    res.send(result);
})

module.exports = router;