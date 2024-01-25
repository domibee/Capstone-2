import React from 'react';
import MedicationList from './components/MedicationList';
import PharmacyList from './components/PharmacyList';
import UserList from './components/UserList';

function App() {
  return (
    <div className="App">
      <h1>HELLO</h1>
      <MedicationList />
      <PharmacyList />
      <UserList />
    </div>
  );
}

export default App;
