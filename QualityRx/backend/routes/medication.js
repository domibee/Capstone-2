const express = require('express');
const router = express.Router();
const Medications = require('../models/medication');
const jwt = require('jsonwebtoken');
const config = require('../config/config');

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

// Retrieve a list of medications
router.get('/', async (req, res) => {
  const { brandName, genericName } = req.query;

  try {
    let medication;

    if (brandName) {
      medication = await Medications.getMedicationByBrandName(brandName);
    } else if (genericName) {
      medication = await Medications.getMedicationByGenericName(genericName);
    } else {
      return res.status(400).json({ error: 'Brand name or generic name required for search' });
    }

    if (!medication || medication.length === 0) {
      return res.status(404).json({ error: 'Medication not found' });
    }

    res.json(medication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Create a new medication
router.post('/', verifyToken, async (req, res) => {
  const { name, description } = req.body;

  try {
    const newMedication = await Medications.createMedication(name, description);
    res.status(201).json(newMedication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
// Update details of a specific medication
router.put('/:id', verifyToken, async (req, res) => {
  const medicationId = req.params.id;
  const { name, description } = req.body;

  try {
    const updatedMedication = await Medications.updateMedication(medicationId, name, description);
    if (!updatedMedication) {
      return res.status(404).json({ error: 'Medication not found' });
    }

    res.json(updatedMedication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Delete a specific medication
router.delete('/:id', verifyToken, async (req, res) => {
  const medicationId = req.params.id;

  try {
    const deletedMedication = await Medications.deleteMedication(medicationId);
    if (!deletedMedication) {
      return res.status(404).json({ error: 'Medication not found' });
    }

    res.json(deletedMedication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
