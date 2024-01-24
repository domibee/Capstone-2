const fs = require('fs');
const parse = require('csv-parse/lib/sync');

// Read CSV file
const csvData = fs.readFileSync('/Users/work/Downloads/Capstone-2/Pharmacies.csv', 'utf-8');

// Parse CSV data
const records = parse(csvData, {
  columns: true,
  skip_empty_lines: true,
});

// Generate SQL INSERT statements
const insertStatements = records.map(record => {
  const columns = Object.keys(record).join(', ');
  const values = Object.values(record).map(value => typeof value === 'string' ? `'${value}'` : value).join(', ');
  return `INSERT INTO pharmacies (${columns}) VALUES (${values});`;
});

// Write SQL file
const sqlFileContent = insertStatements.join('\n');
fs.writeFileSync('/Users/work/Downloads/Capstone-2/pharmacies_insert.sql', sqlFileContent);

console.log('SQL file created successfully.');
