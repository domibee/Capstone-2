// ./backend/models/Users.js
const db = require('../config/db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { jwtSecret } = require('../config/config');

const Users = {
  // Only allow admin users to get all users
  getAllUsers: async (isAdmin) => {
    if (!isAdmin) {
      throw new Error('Unauthorized access');
    }
    return await db('users').select('*');
  },

  // Only allow admin users to get user by ID
  getUserById: async (userId, isAdmin) => {
    if (!isAdmin) {
      throw new Error('Unauthorized access');
    }
    return await db('users').where({ id: userId }).first();
  },


  authenticateUser: async (email, password) => {
    const user = await db('users').where({ email }).first();

    if (!user) {
      return null; // User not found
    }

    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      return null; // Incorrect password
    }

    // Generate JWT token with admin information
    const token = jwt.sign(
      { userId: user.id, username: user.username, isAdmin: user.admin },
      jwtSecret,
      { expiresIn: '1h' }
    );
    
    return { user, token };
  },
};

module.exports = Users;
