// ./backend/models/Medication.js
const {Pool}= require('pg');
const axios = require('axios');
const pool = new Pool({
  host: process.env.DATABASE_HOST || 'localhost',
  user: process.env.DATABASE_USER || 'work',
  password: process.env.DATABASE_PASSWORD || 'dongblebee',
  database: process.env.DATABASE_NAME || 'qualityrx',
  port: 5432,
});
const FDA_API_URL = 'https://api.fda.gov/drug/drugsfda.json';

const Medications = {
  getAllMedications: async (searchTerm) => {
    try {
      // Fetch data from the FDA API
      const response = await axios.get(`${FDA_API_URL}`);
      const results = response.data.results;

      // Filter out discontinued medications
      const activeMedications = results.filter(med => med.marketing_status !== 'Discontinued');

      // Return the first active medication, if any
      return activeMedications.length > 0 ? activeMedications[0] : null;
    } catch (error) {
      console.error('Error fetching medications from FDA:', error);
      throw error;
    }
  },

  getMedicationByBrandName: async (brandName) => {
    try {
      const response = await axios.get(`${FDA_API_URL}?search=openfda.brand_name:"${brandName}"`);
      return response.data.results[0];
    } catch (error) {
      console.error('Error fetching medication details by brand name from FDA:', error);
      throw error;
    }
  },

  getMedicationByGenericName: async (genericName) => {
    try {
      const response = await axios.get(`${FDA_API_URL}?search=openfda.generic_name:"${genericName}"`);
      return response.data.results[0];
    } catch (error) {
      console.error('Error fetching medication details by generic name from FDA:', error);
      throw error;
    }
  },
  
  createMedication: async (name, description) => {
    const result = await pool.query('INSERT INTO _products (drugname, description) VALUES ($1, $2) RETURNING *', [name, description]);
    return result.rows[0];
  },

  updateMedication: async (medicationId, name, description) => {
    const result = await pool.query('UPDATE _products SET name = $2, description = $3 WHERE id = $1 RETURNING *', [medicationId, name, description]);
    return result.rows[0];
  },

  deleteMedication: async (medicationId) => {
    const result = await pool.query('DELETE FROM _products WHERE id = $1 RETURNING *', [medicationId]);
    return result.rows[0];
  },
};

module.exports = Medications;
