// ./backend/models/Medication.js
const {Pool}= require('pg');

const pool = new Pool({
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'work',
  password: process.env.DATABASE_PASSWORD || 'dongblebee',
  database: process.env.DATABASE_NAME || 'qualityrx',
  port: 5432, // Change it according to your PostgreSQL port

});

const Medications = {
  getAllMedications: async () => {
    const result = await pool.query('SELECT * FROM medications');
    return result.rows;
  },

  getMedicationById: async (medicationId) => {
    const result = await pool.query('SELECT * FROM medications WHERE id = $1', [medicationId]);
    return result.rows[0];
  },

  createMedication: async (name, description) => {
    const result = await pool.query('INSERT INTO medications (name, description) VALUES ($1, $2) RETURNING *', [name, description]);
    return result.rows[0];
  },

  updateMedication: async (medicationId, name, description) => {
    const result = await pool.query('UPDATE medications SET name = $2, description = $3 WHERE id = $1 RETURNING *', [medicationId, name, description]);
    return result.rows[0];
  },

  deleteMedication: async (medicationId) => {
    const result = await pool.query('DELETE FROM medications WHERE id = $1 RETURNING *', [medicationId]);
    return result.rows[0];
  },
};

module.exports = Medications;
