// ./backend/models/Pharmacies.js

const pool = require('../config/db');

const Pharmacies = {
  getAllPharmacies: async () => {
    const result = await pool.query('SELECT * FROM pharmacies');
    return result.rows;
  },

  getPharmacyById: async (pharmacyId) => {
    const result = await pool.query('SELECT * FROM pharmacies WHERE id = $1', [pharmacyId]);
    return result.rows[0];
  },

  createPharmacy: async (name, location) => {
    const result = await pool.query('INSERT INTO pharmacies (name, location) VALUES ($1, $2) RETURNING *', [name, location]);
    return result.rows[0];
  },

  updatePharmacy: async (pharmacyId, name, location) => {
    const result = await pool.query('UPDATE pharmacies SET name = $2, location = $3 WHERE id = $1 RETURNING *', [pharmacyId, name, location]);
    return result.rows[0];
  },

  deletePharmacy: async (pharmacyId) => {
    const result = await pool.query('DELETE FROM pharmacies WHERE id = $1 RETURNING *', [pharmacyId]);
    return result.rows[0];
  },
};

module.exports = Pharmacies;
