const express = require('express');
const router = express.Router();
const Users = require('../models/user');

// Retrieve a list of users
router.get('/', async (req, res) => {
  try {
    const users = await Users.getAllUsers();
    res.json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Retrieve details of a specific user
router.get('/:id', async (req, res) => {
  const userId = req.params.id;

  try {
    const user = await Users.getUserById(userId);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Create a new user

router.post('/', async (req, res) => {
  const { username, email, password } = req.body;

  try {
    // Check if the username is already taken
    const isUsernameTaken = await Users.isUsernameTaken(username);

    if (isUsernameTaken) {
      return res.status(400).json({ error: 'Username is already taken' });
    }

    // If the username is not taken, proceed to create a new user
    const newUser = await Users.createUser(username, email, password);
    res.status(201).json(newUser);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});


// Update details of a specific user
router.put('/:id', async (req, res) => {
  const userId = req.params.id;
  const { username, email, password } = req.body;

  try {
    const updatedUser = await Users.updateUser(userId, username, email, password);
    if (!updatedUser) {
      return res.status(404).json({ error: 'User not found' });
    }

    res.json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Delete a specific user
router.delete('/:id', async (req, res) => {
  const userId = req.params.id;

  try {
    const deletedUser = await Users.deleteUser(userId);
    if (!deletedUser) {
      return res.status(404).json({ error: 'User not found' });
    }

    res.json(deletedUser);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Authenticate a user
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const authResult = await Users.authenticateUser(email, password);

    if (!authResult) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    res.json(authResult);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;