const express = require('express');
const router = express.Router();

const hostname = process.env.HOSTNAME

/* GET api listing. */
router.get('/', (req, res) => {
  res.send(process.env.CONTAINER_ID);
});

module.exports = router;