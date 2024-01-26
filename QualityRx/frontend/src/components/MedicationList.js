import React, { useState, useEffect } from 'react';
import axios from 'axios';

const MedicationList = () => {
    const [medications, setMedications] = useState([]);

    useEffect(() => {
        const fetchMedications = async () => {
            try {
                const response = await axios.get('https://api.fda.gov/drug/drugsfda.json?limit=10');
                setMedications(response.data.results);
            } catch (error) {
                console.error('Error fetching medications:', error);
            }
        };

        fetchMedications();
    }, []);

    return (
        <div>
            <h2>Medication List</h2>
            <ul>
                {medications.map((med, index) => (
                    <li key={index}>
                        <h3>{med.sponsor_name}</h3>
                        {med.openfda && (
                            <div>
                                <p>Brand Name: {med.openfda.brand_name ? med.openfda.brand_name.join(', ') : 'N/A'}</p>
                                <p>Generic Name: {med.openfda.generic_name ? med.openfda.generic_name.join(', ') : 'N/A'}</p>
                            </div>
                        )}
                        {med.products && med.products.map((product, pIndex) => (
                            <div key={pIndex}>
                                <p>Product: {product.brand_name}</p>
                                <p>Dosage Form: {product.dosage_form}</p>
                            </div>
                        ))}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default MedicationList;
