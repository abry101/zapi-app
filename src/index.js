const express = require('express');

const app = express();

const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
    res.send("<h4>Hi There!!!</h4>")
});

app.listen(port, ()=> console.log(`API monitoring server is runing ${port}`))