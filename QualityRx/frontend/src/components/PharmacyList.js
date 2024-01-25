import React, { useEffect, useState } from 'react';
import axios from 'axios';

function PharmacyList() {
  const [pharmacies, setPharmacies] = useState([]);

  useEffect(() => {
    axios.get('/api/pharmacies')
      .then(response => {
        setPharmacies(response.data);
      })
      .catch(error => console.error('Error fetching pharmacies', error));
  }, []);

  return (
    <div>
      <h2>Pharmacies</h2>
      <ul>
        {pharmacies.map(pharmacy => <li key={pharmacy.id}>{pharmacy.name}</li>)}
      </ul>
    </div>
  );
}

export default PharmacyList;
