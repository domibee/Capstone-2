import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Home from './components/Homepage';
import Login from './components/user/Login';
import Register from './components/user/Register';
import MedicationSearchResults from './components/medication/MedicationSearchResults.js'; 
import { ChakraProvider } from '@chakra-ui/react'

function App() {
  return (
    <ChakraProvider>
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
    </ChakraProvider>
  );
}

export default App;
