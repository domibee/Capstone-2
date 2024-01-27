// ./backend/routes/prices.js
const express = require('express');
const router = express.Router();
const generatePrices = require('../utils/generatePrices');

router.get('/:medicationName', (req, res) => {
    const medicationName = req.params.medicationName;
    // Assume a base price for demonstration purposes
    const basePrice = Math.random() * (15 - 5) + 5; // Random base price between $5 and $15

    try {
        const prices = generatePrices(basePrice);
        res.json({ medicationName, ...prices });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;
