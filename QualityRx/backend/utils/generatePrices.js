// ./backend/utils/generatePrices.js
const pharmacies = ['CVS', 'Rite Aid', 'Walgreens', 'Costco', 'Walmart', 'Sav-on', 'Target'];

function generatePrices(basePrice) {
    let prices = {};
    pharmacies.forEach(pharmacy => {
        // Randomly adjust the price down by up to $2
        const priceAdjustment = Math.random() * 2;
        const finalPrice = basePrice - priceAdjustment;
        prices[pharmacy] = {
            retailPrice: basePrice.toFixed(2),
            discountedPrice: Math.max(finalPrice, basePrice * 0.8).toFixed(2), // Ensure discounted price is not too low
            bin: generateRandomId(),
            pcn: generateRandomId(),
            group: generateRandomId(),
            memberId: generateRandomId()
        };
    });
    return prices;
}

function generateRandomId(length = 6) {
    let result = '';
    const characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

module.exports = generatePrices;
