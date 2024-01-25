import React, { useEffect, useState } from 'react';
import axios from 'axios';

function MedicationList() {
  const [medications, setMedications] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:3000/api/medications')
      .then(response => {
        setMedications(response.data);
        setIsLoading(false);
      })
      .catch(error => {
        setError(error);
        setIsLoading(false);
      });
  }, []);

  if (isLoading) return <p>Loading...</p>;
  if (error) return <p>Error loading medications: {error.message}</p>;

  return (
    <div>
      <h1>Medications</h1>
      <ul>
        {medications.map(medication => (
          <li key={medication.id}>{medication.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default MedicationList;
