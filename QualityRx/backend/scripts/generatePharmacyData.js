const pharmacies = require('../data/pharmacies');
const fs = require('fs');

function generateRandomId(length = 6) {
  let result = '';
  const characters = '0123456789';
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  return result;
}

const pharmacyDetails = pharmacies.map(pharmacy => ({
  ...pharmacy,
  bin: generateRandomId(),
  pcn: generateRandomId(),
  group: generateRandomId(),
  memberId: generateRandomId()
}));

fs.writeFileSync('./data/pharmacyDetails.json', JSON.stringify(pharmacyDetails, null, 2));
console.log('Pharmacy data generated and saved.');
