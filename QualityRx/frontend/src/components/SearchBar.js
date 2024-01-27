// SearchBar.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/SearchBar.css';

function SearchBar() {
  const [searchTerm, setSearchTerm] = useState('');
  const navigate = useNavigate();

  const handleSearch = (e) => {
    e.preventDefault();
    // Redirect to a route that handles searching for medications by brand or generic name
    navigate(`/medications/search?term=${encodeURIComponent(searchTerm)}`);
  };

  return (
    <form className="searchbar-form" onSubmit={handleSearch}>
      <input
        className="searchbar-input"
        type="text"
        placeholder="Search for medications by brand or generic name..."
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
      />
      <button className="searchbar-button" type="submit" disabled={!searchTerm.trim()}>Search</button>
    </form>
  );
}

export default SearchBar;
