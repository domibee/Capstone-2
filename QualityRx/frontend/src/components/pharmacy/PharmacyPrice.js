// ./frontend/src/components/PharmacyPrice.js

import React from 'react';

function PharmacyPrice({ pharmacy }) {
  return (
    <div>
      <h3>{pharmacy.name}</h3>
      <p>Price: ${pharmacy.price.toFixed(2)}</p>
      <p>BIN: {pharmacy.bin}</p>
      <p>PCN: {pharmacy.pcn}</p>
      <p>Group: {pharmacy.group}</p>
      <p>Member ID: {pharmacy.memberId}</p>
    </div>
  );
}

export default PharmacyPrice;
