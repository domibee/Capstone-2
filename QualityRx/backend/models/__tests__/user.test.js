// ./backend/models/__tests__/users.test.js
const Users = require('../user');

describe('Users model', () => {
  describe('getUserById', () => {
    it('should return a user object if the user exists', async () => {
      const userId = 1; // Assuming this user ID exists in your test database
      const user = await Users.getUserById(userId);
      expect(user).toBeDefined();
      expect(user.id).toBe(userId);
    });

    it('should return null if the user does not exist', async () => {
      const userId = 999; // Assuming this user ID does not exist
      const user = await Users.getUserById(userId);
      expect(user).toBeNull();
    });
  });

  
});
