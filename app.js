const express = require('express');
const { exec } = require('child_process');
const app = express();

// Hardcoded Secret (Triggers Semgrep Secret Scan)
const AWS_SECRET_KEY = "AKIAIOSFODNN7EXAMPLE_SECRET_KEY";

app.get('/ping', (req, res) => {
    const host = req.query.host;

    // Command Injection vulnerability (Triggers Semgrep SAST Scan)
    exec(`ping -c 1 ${host}`, (error, stdout, stderr) => {
        if (error) {
            res.status(500).send(error.message);
            return;
        }
        res.send(stdout);
    });
});

app.listen(3000, () => console.log('App running on port 3000'));
