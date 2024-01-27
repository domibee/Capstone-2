import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Home from './components/Homepage';
import Login from './components/user/Login';
import Register from './components/user/Register';
import MedicationSearchResults from './components/medication/MedicationSearchResults.js'; 


function App() {
  return (
    <Router>
      <div>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/medications/search" element={<MedicationSearchResults />} />
         
        </Routes>
      </div>
    </Router>
  );
}

export default App;
