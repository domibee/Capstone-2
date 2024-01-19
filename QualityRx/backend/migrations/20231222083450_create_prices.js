/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

exports.up = function (knex) {
  return knex.schema.createTable('prices', function (table) {
    table.increments('id').primary();
    table.integer('medication_id').unsigned();
    table.foreign('medication_id').references('medications.id');
    table.integer('pharmacy_id').unsigned();
    table.foreign('pharmacy_id').references('pharmacies.id');
    table.float('price');
  });
};
/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable('prices');
  };
   