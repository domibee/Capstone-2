// ./backend/server.js
const express = require('express');
const cors = require('cors');
const medicationsRouter = require('./routes/medication');
const pharmaciesRouter = require('./routes/pharmacy');
const usersRouter = require('./routes/user');
const config = require('./config/config');
const insertRandomPrices = require('./insertRandomPrices');

const app = express();

app.use(cors());
app.use(express.json());

// Log the contents of the 'config' module
console.log('Config:', config);

// Use environment variables from 'config'
const { PORT } = config;
// // Call the function to insert random prices
// insertRandomPrices(100); // Adjust the number of rows as needed

app.use('/api/medications', medicationsRouter);
app.use('/api/pharmacies', pharmaciesRouter);
app.use('/api/users', usersRouter);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
