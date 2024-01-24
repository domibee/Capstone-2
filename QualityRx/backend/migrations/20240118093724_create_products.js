/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTableIfNotExists('public.products', function (table) {
      table.increments('id').primary();
      table.decimal('price', 8, 2);
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTableIfExists('public.products');
  };
  