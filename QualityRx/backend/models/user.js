// ./backend/models/Users.js
require('dotenv').config();
const db = require('../config/db')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const jwtSecret = process.env.JWT_SECRET;

const Users = {
  getAllUsers: async () => {
    return await db('users').select('*');
  },

  getUserById: async (userId) => {
    return await db('users').where({ id: userId }).first();
  },

  async isUsernameTaken(username) {
    // Query your database to check if the username is taken
    const existingUser = await db('users').where({ username }).first();
    return !!existingUser; // Returns true if username is taken, false otherwise
  },

  async createUser(username, email, password) {
    // Hash the password before storing it in the database
    const hashedPassword = await bcrypt.hash(password, 10);
  
    // Insert the new user into your database
    const [newUserId] = await db('users').insert({
      username,
      email,
      password: hashedPassword,
    }).returning('id');
  
    return newUserId; // Return only the ID, not an object
  },

  updateUser: async (userId, username, email, password) => {
    const hashedPassword = await bcrypt.hash(password, 10);

    const [updatedUser] = await db('users')
      .where({ id: userId })
      .returning(['id', 'username', 'email'])
      .update({ username, email, password: hashedPassword });

    return updatedUser;
  },

  deleteUser: async (userId) => {
    const [deletedUser] = await db('users')
      .where({ id: userId })
      .returning(['id', 'username', 'email'])
      .del();

    return deletedUser;
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

    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, username: user.username },
      jwtSecret,
      { expiresIn: '1h' }
    );
    
    return { user, token };
    
  },
};

module.exports = Users;
