const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');

app.use(bodyParser.json());

const conn = mysql.createConnection({
    host: 'https://se.mfu.ac.th/phpmyadmin/db_structure.php?server=1&db=md22_annop_db',
    user: 'md22annop',
    password: '6331305031',
    database: 'md22_annop_db'
})

conn.connect((err) => {
    if (err) throw err;
    console.log('Mysql Connected...')
});

////////////////////----- Start SQL -----////////////////////

// get all mfuwallet
app.get('/api/getAllmfuwallet/', (req, res) => {
    let sql = "SELECT * FROM mfuwallet ORDER BY id";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": 200, "error": null, "response": results }));
    });
});

// get mfuwallet by ID
app.get('/api/getmfuwallet/:id', (req, res) => {
    let sql = "SELECT * FROM mfuwallet WHERE id = " + req.params.id;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": 200, "error": null, "response": results }));
    });
});

// create mfuwallet
app.post('/api/createmfuwallet', (req, res) => {
    let data = {
        email: req.body.email,
        username: req.body.username,
        password: req.body.password,
        amount: req.body.amount,
    };
    // console.info(data)
    let sql = "INSERT INTO mfuwallet SET ?";
    let query = conn.query(sql, data, (err, results) => {
        if (err);
        res.send(JSON.stringify({ "status": 200, "error": null, "response": results }));
    });
});

// update mfuwallet by ID
app.put('/api/updatemfuwallet/:id', (req, res) => {
    let sql = "UPDATE mfuwallet SET email = '" + req.body.email + "' " +
        " ,username = '" + req.body.username + "' " +
        " ,password = '" + req.body.password + "' " +
        " ,amount =  '" + req.body.amount + "' " +
        " WHERE acc_ID = " + req.params.id;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": 200, "error": null, "response": results }));
    });
});

// dalete mfuwallet by ID
app.delete('/api/deletemfuwallet/:id', (req, res) => {
    let sql = "DELETE FROM mfuwallet WHERE id = " + req.params.id;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": 200, "error": null, "response": results }));
    });
})


////////////////////////////////////////////////////////////

app.listen(3000, () => {

    console.log('Server started on port 3000....')
});