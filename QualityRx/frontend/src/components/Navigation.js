import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/medications">Medications</Link>
      <Link to="/pharmacies">Pharmacies</Link>
      <Link to="/login">Login</Link>
    </nav>
  );
};

export default Navbar;
