// MedicationPrice.js (Frontend component)
import React, { useEffect, useState } from 'react';
import axios from 'axios';

function MedicationPrice({ medicationName }) {
    const [priceData, setPriceData] = useState(null);

    useEffect(() => {
        const fetchPriceData = async () => {
            try {
                const response = await axios.get(`http://localhost:3001/api/prices/${medicationName}`);
                setPriceData(response.data);
            } catch (error) {
                console.error('Error fetching price data:', error);
            }
        };

        if (medicationName) {
            fetchPriceData();
        }
    }, [medicationName]);

    if (!priceData) {
        return <div>Price Data Loading...</div>;
    }

    return (
        <div>
            <h3>Prices for {medicationName}</h3>
            <p>Retail Price: ${priceData.retailPrice}</p>
            <p>Discounted Price: ${priceData.finalDiscountedPrice}</p>
        </div>
    );
}

export default MedicationPrice;
