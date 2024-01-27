const pharmacyDetails = require('../data/pharmacyDetails.json');
const { generateRandomPrice } = require('../utils/pricing');
const fs = require('fs');

function updatePharmacyPrices() {
  pharmacyDetails.forEach(pharmacy => {
    const basePrice = getCurrentBasePriceForMedication(); // This function should be implemented to fetch the current base price
    pharmacy.pricing = generateRandomPrice(basePrice);
  });

  fs.writeFileSync('./data/pharmacyDetails.json', JSON.stringify(pharmacyDetails, null, 2));
  console.log('Pharmacy prices updated.');
}

// Placeholder function, should be replaced with actual logic
function getCurrentBasePriceForMedication() {
  return Math.random() * 20 + 10; // Random price between $10 and $30
}

updatePharmacyPrices();
