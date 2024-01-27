const pool = require('../config/db');

const PharmacyPrice = {
  getPricesByMedication: async (medicationName) => {
    const result = await pool.query('SELECT * FROM pharmacy_prices WHERE medication_name = $1', [medicationName]);
    return result.rows;
  },

  addPrice: async (pharmacyId, medicationName, price) => {
    const result = await pool.query('INSERT INTO pharmacy_prices (pharmacy_id, medication_name, price) VALUES ($1, $2, $3) RETURNING *', [pharmacyId, medicationName, price]);
    return result.rows[0];
  },

  updatePrice: async (id, pharmacyId, medicationName, price) => {
    const result = await pool.query('UPDATE pharmacy_prices SET pharmacy_id = $2, medication_name = $3, price = $4 WHERE id = $1 RETURNING *', [id, pharmacyId, medicationName, price]);
    return result.rows[0];
  },

  deletePrice: async (id) => {
    await pool.query('DELETE FROM pharmacy_prices WHERE id = $1', [id]);
  }
};

module.exports = PharmacyPrice;
