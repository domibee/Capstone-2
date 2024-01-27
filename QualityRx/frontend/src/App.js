import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Home from './components/Homepage';
import Login from './components/user/Login';
import Register from './components/user/Register';
import MedicationList from './components/medication/MedicationList'; 


function App() {
  return (
    <Router>
      <div>
        <nav>
          <Link to="/">Home</Link> |
          <Link to="/login">Login</Link> | 
          <Link to="/register">Register</Link>
        </nav>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/medications" element={<MedicationList />} />
         
        </Routes>
      </div>
    </Router>
  );
}

export default App;
