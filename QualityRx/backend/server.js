// ./backend/server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const medicationsRouter = require('./routes/medications');
const pharmaciesRouter = require('./routes/pharmacies');
const usersRouter = require('./routes/users');
const config = require('./config/config');

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Log the contents of the 'config' module
console.log('Config:', config);

// Use environment variables from 'config'
const { PORT } = config;

app.use('/api/medications', medicationsRouter);
app.use('/api/pharmacies', pharmaciesRouter);
app.use('/api/users', usersRouter);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
