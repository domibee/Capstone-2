// tests/user.test.js
const request = require('supertest');
const app = require('../server'); // Adjust the path as needed

describe('User Routes', () => {
  test('GET /api/users/:userId returns user profile', async () => {
    const response = await request(app).get('/api/users/1');

    expect(response.status).toBe(200);
    expect(response.body.success).toBe(true);
    // Add more assertions based on your expected response
  });

  test('POST /api/users/register creates a new user', async () => {
    const userData = {
      username: 'testuser',
      password: 'testpassword',
      email: 'test@example.com',
    };

    const response = await request(app).post('/api/users/register').send(userData);

    expect(response.status).toBe(200);
    expect(response.body.success).toBe(true);
    // Add more assertions based on your expected response
  });

  // Add more test cases for other routes
});
