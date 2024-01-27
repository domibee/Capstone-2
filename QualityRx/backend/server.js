// ./backend/server.js

const knex = require('knex');
const express = require('express');
const cors = require('cors');
const medicationsRouter = require('./routes/medication');
const pharmaciesRouter = require('./routes/pharmacy');
const usersRouter = require('./routes/user');
const config = require('./config/config');
const priceRoutes = require('./routes/pharmacyPrice');
// Use environment variables from 'config'
const { PORT } = config;

const app = express();

app.use(cors());
app.use(express.json());


app.use('/api/medications', medicationsRouter);
app.use('/api/pharmacies', pharmaciesRouter);
app.use('/api/users', usersRouter);
app.use('/api/prices', priceRoutes);
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
