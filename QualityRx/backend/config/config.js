// ./backend/config/config.js

// Define your configuration variables here
require('dotenv').config();

const PORT = 3001; // Set the desired local port

const database = {
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'work',
  password: process.env.DATABASE_PASSWORD || 'dongblebee',
  name: process.env.DATABASE_NAME || 'qualityrx',
};

module.exports = {
  PORT,
  database,
  jwtSecret: process.env.JWT_SECRET
};
