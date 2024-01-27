// ./src/components/Navigation.js
import React from 'react';
import { Link } from 'react-router-dom';

function Navigation() {
  return (
    <nav>
      <Link to="/">Home</Link> | 
      <Link to="/medications">Medications</Link> | 
      <Link to="/pharmacies">Pharmacies</Link> | 
      <Link to="/profile">User Profile</Link> |
      <Link to="/login">Login</Link> | 
      <Link to="/register">Register</Link>
    </nav>
  );
}

export default Navigation;
