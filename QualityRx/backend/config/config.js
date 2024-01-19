// ./backend/config/config.js

// Define your configuration variables here
const PORT = 3000; // Set the desired local port

const database = {
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'work',
  password: process.env.DATABASE_PASSWORD || 'dongblebee',
  name: process.env.DATABASE_NAME || 'qualityrx',
};

module.exports = {
  PORT,
  database,
  // Add more configuration variables if needed
};
