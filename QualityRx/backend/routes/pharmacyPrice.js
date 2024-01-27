// ./backend/routes/prices.js
const express = require('express');
const router = express.Router();
const generatePrices = require('../utils/priceGenerator');

router.get('/:medicationName', (req, res) => {
    const medicationName = req.params.medicationName;
    // Assume a base price for demonstration purposes
    const basePrice = 10; // You can dynamically determine this based on the medication

    try {
        const prices = generatePrices(basePrice);
        res.json({ medicationName, ...prices });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;
