const express = require('express');
const router = express.Router();
const Pharmacies = require('../models/pharmacy');
const jwt = require('jsonwebtoken');
const config = require('../config/config');
const jwtSecret = process.env.JWT_SECRET;

// Middleware to verify JWT token
const verifyToken = (req, res, next) => {
  const token = req.header('Authorization');
  if (!token) return res.status(401).json({ error: 'Access denied. No token provided.' });

  jwt.verify(token, config.jwtSecret, (err, decoded) => {
    if (err) return res.status(401).json({ error: 'Invalid token.' });
    req.userId = decoded.userId;
    next();
  });
};

// Retrieve a list of pharmacies
router.get('/', async (req, res) => {
  try {
    const pharmacies = await Pharmacies.getAllPharmacies();
    res.json(pharmacies);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Retrieve details of a specific pharmacy
router.get('/:id', async (req, res) => {
  const pharmacyId = req.params.id;

  try {
    const pharmacy = await Pharmacies.getPharmacyById(pharmacyId);
    if (!pharmacy) {
      return res.status(404).json({ error: 'Pharmacy not found' });
    }

    res.json(pharmacy);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Create a new pharmacy
router.post('/', verifyToken, async (req, res) => {
  const { name, location } = req.body;

  try {
    const newPharmacy = await Pharmacies.createPharmacy(name, location);
    res.status(201).json(newPharmacy);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Update details of a specific pharmacy
router.put('/:id', verifyToken, async (req, res) => {
  const pharmacyId = req.params.id;
  const { name, location } = req.body;

  try {
    const updatedPharmacy = await Pharmacies.updatePharmacy(pharmacyId, name, location);
    if (!updatedPharmacy) {
      return res.status(404).json({ error: 'Pharmacy not found' });
    }

    res.json(updatedPharmacy);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Delete a specific pharmacy
router.delete('/:id', verifyToken, async (req, res) => {
  const pharmacyId = req.params.id;

  try {
    const deletedPharmacy = await Pharmacies.deletePharmacy(pharmacyId);
    if (!deletedPharmacy) {
      return res.status(404).json({ error: 'Pharmacy not found' });
    }

    res.json(deletedPharmacy);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
