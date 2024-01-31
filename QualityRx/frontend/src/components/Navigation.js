// ./src/components/Navigation.js
import React from 'react';
import { Link } from 'react-router-dom';
import '../styles/Navigation.css';

function Navigation() {
  return (
    <nav className="navbar">
      <div className="navbar-links">
      <Link to="/">Home</Link> 
      <Link to="/login">Login</Link> 
      <Link to="/register">Register</Link>
      </div>
    </nav>
  );
}

export default Navigation;
