/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable('medications', function (table) {
    table.increments('id').primary();
    table.string('brand_name');
    table.string('generic_name');
    table.float('dosage');
    table.string('unit');
    table.string('adverse_events');
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable('medications');
  };
    