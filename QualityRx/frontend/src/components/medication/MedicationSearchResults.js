
import './MedicationSearchResult.css';
import React, { useState, useEffect } from 'react';
import { useSearchParams, Link } from 'react-router-dom';
import axios from 'axios';
import SearchBar from '../SearchBar';
import MedicationPrice from './MedicationPrice';


function MedicationSearchResults() {
  const [searchParams] = useSearchParams();
  const searchTerm = searchParams.get('term');
  const [medicationDetails, setMedicationDetails] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [noResults, setNoResults] = useState(false);

  useEffect(() => {
    const fetchMedicationDetails = async () => {
      setLoading(true);
      setError('');
      try {
        // Fetching medication details from drug labeling API
        const labelResponse = await axios.get(`https://api.fda.gov/drug/label.json?search=openfda.brand_name:"${searchTerm}"&limit=1`);
        const labelData = labelResponse.data.results[0];

        // Fetching medication details from drug name API
        const drugResponse = await axios.get(`https://api.fda.gov/drug/drugsfda.json?search=openfda.brand_name:"${searchTerm}"&limit=1`);
        const drugData = drugResponse.data.results[0];

        if (!labelData || !drugData) {
          setNoResults(true);
          return;
        }
        setMedicationDetails({
          indicationsAndUsage: labelData?.indications_and_usage?.join(', ') || 'No indications and usage information available.',
          purpose: labelData?.purpose?.join(', ') || 'No purpose information available.',
          dosageAndAdministration: labelData?.dosage_and_administration?.join(', ') || 'No dosage and administration information available.',
          keepOutOfReachOfChildren: labelData?.keep_out_of_reach_of_children?.join(', ') || 'No specific information available.',
          warnings: labelData?.warnings?.join(', ') || 'No warnings information available.',
          otherSafetyInformation: labelData?.other_safety_information?.join(', ') || 'No other safety information available.',
          pregnancyOrBreastFeeding: labelData?.pregnancy_or_breast_feeding?.join(', ') || 'No pregnancy or breast feeding information available.',
          stopUse: labelData?.stop_use?.join(', ') || 'No stop use information available.',
          packageLabelPrincipalDisplayPanel: labelData?.package_label_principal_display_panel?.join(', ') || 'No package label information available.',
          brandName: drugData.openfda?.brand_name?.join(', '),
          genericName: drugData.openfda?.generic_name?.join(', '),
          manufacturerName: drugData.openfda?.manufacturer_name?.join(', ')
        });
      } catch (err) {
        // Check if the error is due to no results found
        if (err.response && err.response.status === 404) {
          setError(`No medication found for the search term: "${searchTerm}"`);
        } else {
          setError('Error fetching medication data');
          console.error(err);
        }
      } finally {
        setLoading(false);
      }
    };

    if (searchTerm) {
      fetchMedicationDetails();
    }
  }, [searchTerm]);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>{error}</div>;
  }

  // Display medication details
  return (
    <div className="medication-results-container">
      <div className="search-bar-custom">
      <div className="search-bar-with-logo">
        <Link to="/">
          <img src="/QualityRx-logo.png" alt="QualityRx Logo" className="logo-small" />
        </Link>
      </div>
      <SearchBar />
      <MedicationPrice medicationName={searchTerm} />
      <div className="medication-details">
      <h2>Medication Details</h2>
      <p><strong>Brand Name:</strong> {medicationDetails.brandName}</p>
      <p><strong>Generic Name:</strong> {medicationDetails.genericName}</p>
      <p><strong>Manufacturer:</strong> {medicationDetails.manufacturerName}</p>
      <p><strong>Indications and Usage:</strong> {medicationDetails.indicationsAndUsage}</p>
      <p><strong>Purpose:</strong> {medicationDetails.purpose}</p>
      <p><strong>Dosage and Administration:</strong> {medicationDetails.dosageAndAdministration}</p>
      <p><strong>Keep Out of Reach of Children:</strong> {medicationDetails.keepOutOfReachOfChildren}</p>
      <p><strong>Warnings:</strong> {medicationDetails.warnings}</p>
      <p><strong>Other Safety Information:</strong> {medicationDetails.otherSafetyInformation}</p>
      <p><strong>Pregnancy or Breast Feeding:</strong> {medicationDetails.pregnancyOrBreastFeeding}</p>
      <p><strong>Stop Use:</strong> {medicationDetails.stopUse}</p>
      <p><strong>Package Label Principal Display Panel:</strong> {medicationDetails.packageLabelPrincipalDisplayPanel}</p>
      </div>
      </div>
    </div>
  );
}

export default MedicationSearchResults;
