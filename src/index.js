const express = require('express');

const app = express();

const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h4>Hi There!!!</h4>');
});
// Request Handler
app.post('/Signup', async (req, res) => {
  // get request input
  const { email, password } = req.body.input;

  // run some business logic

  /*
    // In case of errors:
    return res.status(400).json({
      message: "error happened"
    })
    */

  // success
  return res.json({
    id: '<value>',
    email: '<value>',
    password: '<value>',
  });
});

// Request Handler
app.post('/Login', async (req, res) => {
  // get request input
  const { email, password } = req.body.input;

  // run some business logic

  /*
    // In case of errors:
    return res.status(400).json({
      message: "error happened"
    })
    */

  // success
  return res.json({
    token: '<value>',
  });
});

app.listen(port, () => console.log(`API monitoring server is runing ${port}`));
