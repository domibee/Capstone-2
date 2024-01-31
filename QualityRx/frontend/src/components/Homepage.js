import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import SearchBar from './SearchBar';
import '../styles/Home.css';
import Navigation  from  './Navigation';

function Home() {
  const navigate = useNavigate();
  const handleSearch = (e) => {
    e.preventDefault();
    // Navigate to the search results page with the searchTerm as a query parameter
    navigate(`/medications?search=${encodeURIComponent(searchTerm)}`);
  };

  return (
    <div className="home-container">
      <Navigation/>
      <div className="navbar-logo">
        <img src="/QualityRx-logoandname.png" alt="QualityRx Logo" />
      </div>
      <h1 className="home-header">Welcome to QualityRx</h1>
      <p className="home-content">Your go-to app for comparing medication prices.</p>

      {/* Search Bar */}
      <SearchBar />

      {/* Promotional Content */}
      <section className="home-content">
        <h2>Why Choose QualityRx?</h2>
        <p>Find the best prices for your medications at local pharmacies.</p>
      </section>

    </div>
  );
}

export default Home;
