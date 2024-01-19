
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const insertRandomPrices = require('../../backend/insertRandomPrices');
const drugRoutes = require('../../backend/routes/medications');

const app = express(); 
const PORT = process.env.PORT || 3000;

// Specify the number of rows you want to insert
const numberOfRows = 100000; // You can adjust this number

// Call the function to insert random prices
insertRandomPrices(numberOfRows);

app.use(cors());
app.use(bodyParser.json());
app.use('/api/drugs', drugRoutes);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`)
})

