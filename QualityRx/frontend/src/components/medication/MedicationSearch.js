import React, { useState } from 'react';
import axios from 'axios';

function MedicationSearch() {
  const [searchTerm, setSearchTerm] = useState('');
  const [medication, setMedication] = useState(null);

  const handleSearch = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(`http://localhost:3001/api/medications/search`, { params: { term: searchTerm } });
      setMedication(response.data);
    } catch (error) {
      console.error('Error fetching medication:', error);
    }
  };

  return (
    <div>
      <form onSubmit={handleSearch}>
        <input
          type="text"
          placeholder="Search for a medication..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
        <button type="submit">Search</button>
      </form>
      {/* Display the medication details */}
      {medication && (
        <div>
          <h3>{medication.brand_name}</h3>
          {/* Display other medication details */}
        </div>
      )}
    </div>
  );
}

export default MedicationSearch;
