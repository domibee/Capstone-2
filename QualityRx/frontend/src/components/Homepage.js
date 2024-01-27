import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';

function Home() {
  const [searchTerm, setSearchTerm] = useState('');
  const navigate = useNavigate();

  const handleSearch = (e) => {
    e.preventDefault();
    // Navigate to the search results page with the searchTerm as a query parameter
    navigate(`/medications?search=${encodeURIComponent(searchTerm)}`);
  };

  return (
    <div>
      <h1>Welcome to QualityRx</h1>
      <p>Your go-to app for comparing medication prices.</p>

      {/* Search Bar */}
      <form onSubmit={handleSearch}>
        <input
          type="text"
          placeholder="Search for medications..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
        <button type="submit">Search</button>
      </form>

      {/* Promotional Content */}
      <section>
        <h2>Why Choose QualityRx?</h2>
        <p>Find the best prices for your medications at local pharmacies.</p>
      </section>

      {/* Navigation Links */}
      <nav>
        <ul>
          <li><Link to="/pharmacies">Find Pharmacies</Link></li>
          <li><Link to="/about">About Us</Link></li>
        </ul>
      </nav>
    </div>
  );
}

export default Home;
