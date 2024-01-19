// knexfile.js
//setup  for multiple environments
//dotenv to easily switch between environments without modifying the code
// ./backend/knexfile.js
require('dotenv').config();

module.exports = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DATABASE_HOST || 'localhost',
      user: process.env.DATABASE_USER || 'work',
      password: process.env.DATABASE_PASSWORD || 'dongblebee',
      database: process.env.DATABASE_NAME || 'qualityrx',
    },
    migrations: {
      tableName: 'knex_migrations',
      directory: './migrations',
    },
  },
  production: {
    client: 'pg',
    connection: process.env.DATABASE_URL,
    migrations: {
      tableName: 'knex_migrations',
      directory: './migrations',
    },
  },
};


//  for package.json
//  "scripts": {
//     "start": "NODE_ENV=development node index.js",
//     "start:prod": "NODE_ENV=production node index.js"
//   }
  

//   # For development
//   knex migrate:latest
  
//   # For production
//   knex migrate:latest --env production