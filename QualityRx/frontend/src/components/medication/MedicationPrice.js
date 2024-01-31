import React, { useEffect, useState } from 'react';
import axios from 'axios';

function MedicationPrice({ medicationName }) {
    const [prices, setPrices] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchPrices = async () => {
            setLoading(true);
            try {
                const response = await axios.get(`http://localhost:3001/api/prices/${medicationName}`);
                setPrices(response.data.prices);
            } catch (error) {
                console.error('Error fetching prices:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchPrices();
    }, [medicationName]);

    if (loading) return <div>Loading...</div>;
    if (!prices) return <div>No pricing information available.</div>;

    return (
        <div>
            <h2>Prices for {medicationName}</h2>
            {Object.entries(prices).map(([pharmacyName, priceInfo], index) => (
                <div key={index}>
                    <h3>{pharmacyName}</h3>
                    <p>Retail Price: ${priceInfo.retailPrice}</p>
                    <p>Discounted Price: ${priceInfo.discountedPrice}</p>
                    {/* Display additional details like BIN, PCN, etc. */}
                </div>
            ))}
        </div>
    );
}

export default MedicationPrice;
