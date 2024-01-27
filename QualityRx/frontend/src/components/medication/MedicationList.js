import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useSearchParams } from 'react-router-dom';

function MedicationsList() {
  const [medication, setMedication] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [searchParams] = useSearchParams();
  
  useEffect(() => {
    const searchTerm = searchParams.get('search');
    if (searchTerm) {
      const fetchData = async () => {
        setLoading(true);
        setError('');
        try {
          const response = await axios.get(`https://api.fda.gov/drug/drugsfda.json?search=openfda.brand_name:"${encodeURIComponent(searchTerm)}"&limit=1`);
          setMedication(response.data.results[0]);
        } catch (err) {
          setError('Error fetching medication data');
          setMedication(null);
        } finally {
          setLoading(false);
        }
      };

      fetchData();
    }
  }, [searchParams]);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>{error}</div>;
  }

  return (
    <div>
      <h2>Medication Search Results</h2>
      {medication ? (
        <div>
          <h3>{medication.openfda?.brand_name?.[0]}</h3>
          <p>Generic Name: {medication.openfda?.generic_name?.[0]}</p>
        </div>
      ) : (
        <p>No medication found</p>
      )}
    </div>
  );
}

export default MedicationsList;
