
# QualityRx

QualityRx is a medication pricing comparison app designed to help users find the best prices for their prescriptions across different pharmacies. With its user-friendly interface, QualityRx empowers users to make informed decisions about their healthcare expenses by comparing medication prices at local pharmacies.

## Table of Contents

- [About](#about)
- [Technologies Stack](#technologies-stack)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Tests](#tests)
- [User Flow](#user-flow)
- [Example API Endpoints](#example-api-endpoints)

## About

QualityRx provides a seamless way to search and compare medication prices, helping users to discover the most cost-effective options for their prescriptions. The app aims to assist in reducing healthcare expenses through informed decision-making.

## Technology Stack

- **Frontend:** React, Axios, React Router
- **Backend:** Node.js, Express, PostgreSQL
- **Authentication:** JWT, bcrypt
- **Testing:** Jest, Supertest
- **Deployment:** Netlify
- **Data Source:**
  - FDA Drug (https://open.fda.gov/apis/drug/drugsfda/)

## Features

- **Medication Search:** Users can search for medications by their brand or generic names using the FDA's open data.
- **Price Comparison:** Display randomized, yet realistic, pricing information for medications across various pharmacies.
- **Pharmacy Information:** Users can view detailed information about pharmacies, including random discount codes.
- **User Authentication:** Secure login and registration system for users.
- **Admin Features:** Special functionalities available for users marked as admins, like viewing all users.

## Getting Started

These instructions will help you set up and run QualityRx on your local machine for development and testing purposes.

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/QualityRx.git
   ```
2. Install backend dependencies
   ```bash
   cd QualityRx/backend
   npm install
   ```
3. Install frontend dependencies
   ```bash
   cd QualityRx/frontend
   npm install
   ```
4. Set up the PostgreSQL database and import medication data using the Drugs@FDA utility.

5. Create a `.env` file in the backend directory and add your database and JWT secret configurations.

6. Start the backend server
   ```bash
   cd backend
   node server.js
   ```
7. Start the frontend application
   ```bash
   cd frontend
   npm start
   ```
## Tests

The backend of QualityRx includes several unit and integration tests to ensure that APIs and database models function as expected. Tests are written using Jest and Supertest.

To run the tests, navigate to the backend directory and use the command:

```bash
npm test
```

## User Flow

1. **Registration/Login:** Users start by registering or logging into the application.
2. **Searching for Medications:** Users can search for medications using the search bar on the homepage.
3. **Viewing Medication Prices:** After a search, users are presented with medication details and prices across different pharmacies.
4. **Exploring Pharmacy Information:** Users can explore detailed information about pharmacies, including special discount codes.

### Example API Endpoints:

- `GET /api/medications/search?term={medicationName}`: Search for medications.
- `POST /api/users/register`: Register a new user.

