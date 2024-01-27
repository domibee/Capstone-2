function generateRandomPrice(basePrice) {
    const variance = Math.random() * 2; // $0 to $2 range
    const discount = basePrice - variance;
    return {
      retailPrice: basePrice,
      discountedPrice: discount.toFixed(2) // Rounded to 2 decimal places
    };
  }
  
  module.exports = { generateRandomPrice };
  