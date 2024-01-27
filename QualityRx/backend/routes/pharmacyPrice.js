// ./backend/routes/prices.js
const express = require('express');
const router = express.Router();
const generatePrices = require('../utils/generatePrices');

router.get('/:medicationName', (req, res) => {
    const medicationName = req.params.medicationName;
    
    // For demonstration, we'll use a dynamic base price based on the length of the medication name
    const basePrice = 10 + medicationName.length % 5; // Adjust this logic as needed

    try {
        const prices = generatePrices(basePrice);
        res.json({ medicationName, prices });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;
