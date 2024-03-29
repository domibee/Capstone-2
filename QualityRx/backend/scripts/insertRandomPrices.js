const { Pool } = require('pg');

// Create a connection pool
const pool = new Pool({
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'work',
  password: process.env.DATABASE_PASSWORD || 'dongblebee',
  database: process.env.DATABASE_NAME || 'qualityrx',
  port: 5432, // Change it according to your PostgreSQL port

});

// Function to generate a random price
const getRandomPrice = () => {
  return Math.floor(Math.random() * 1000) + 1; // Adjust the range as needed
};

// Function to generate and execute the SQL query
const insertRandomPrices = async (rowCount) => {
  const client = await pool.connect();

  try {
    // Begin a transaction
    await client.query('BEGIN');

    // Generate and execute the SQL query for the specified number of rows
    for (let i = 0; i < rowCount; i++) {
      const randomPrice = getRandomPrice();
      await client.query('INSERT INTO _products (price) VALUES ($1)', [randomPrice]);
    }
    // Commit the transaction
    await client.query('COMMIT');
    console.log(`Random prices inserted successfully for ${rowCount} rows!`);
  } catch (error) {
    // Rollback the transaction in case of an error
    await client.query('ROLLBACK');
    console.error('Error inserting random prices:', error);
  } finally {
    // Release the client back to the pool
    client.release();
  }
};

module.exports = insertRandomPrices;
