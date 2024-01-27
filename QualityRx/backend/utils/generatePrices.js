// ./backend/utils/priceGenerator.js
function generatePrices(baseRetailPrice) {
  // Randomly choose a discount between $1 and $2
  const discount = Math.random() + 1; // This generates a number between 1 and 2
  const discountedPrice = baseRetailPrice - discount;

  // Round both prices to 2 decimal places
  const retailPrice = Math.round(baseRetailPrice * 100) / 100;
  const finalDiscountedPrice = Math.round(discountedPrice * 100) / 100;

  return { retailPrice, finalDiscountedPrice };
}

module.exports = generatePrices;
