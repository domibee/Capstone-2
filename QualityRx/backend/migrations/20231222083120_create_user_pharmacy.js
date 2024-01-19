/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable('user_pharmacy', function (table) {
      table.increments('id').primary();
      table.integer('user_id').unsigned();
      table.foreign('user_id').references('users.id');
      table.integer('pharmacy_id').unsigned();
      table.foreign('pharmacy_id').references('pharmacies.id');
    });
  };
  

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.schema.dropTable('user_pharmacy');
};
   