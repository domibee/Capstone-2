// src/components/user/UserList.js

import React, { useEffect, useState } from 'react';
import axios from 'axios';

function UserList() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3001/api/users')
      .then(response => {
        setUsers(response.data);
      })
      .catch(error => console.error('Error fetching users', error));
  }, []);

  return (
    <div>
      <h2>Users</h2>
      <ul>
        {users.map(user => <li key={user.id}>{user.username}</li>)}
      </ul>
    </div>
  );
}

export default UserList;
