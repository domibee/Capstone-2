/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.dropTableIfExists('drugs');
  };
  
  exports.down = function (knex) {
    return knex.schema.createTable('drugs', function (table) {
      // Define your table columns
    });
  };
  