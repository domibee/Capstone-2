const express = require('express');
const router = express.Router();
const PharmacyPrice = require('../models/pharmacyprice');

// Get prices for a specific medication
router.get('/:medicationName', async (req, res) => {
  try {
    const prices = await PharmacyPrice.getPricesByMedication(req.params.medicationName);
    res.json(prices);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Add a new price
router.post('/', async (req, res) => {
  const { pharmacyId, medicationName, price } = req.body;
  try {
    const newPrice = await PharmacyPrice.addPrice(pharmacyId, medicationName, price);
    res.status(201).json(newPrice);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Update an existing price
router.put('/:id', async (req, res) => {
  const { pharmacyId, medicationName, price } = req.body;
  try {
    const updatedPrice = await PharmacyPrice.updatePrice(req.params.id, pharmacyId, medicationName, price);
    res.json(updatedPrice);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Delete a price
router.delete('/:id', async (req, res) => {
  try {
    await PharmacyPrice.deletePrice(req.params.id);
    res.json({ message: 'Price deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
