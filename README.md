
# QualityRx

QualityRx is a medication pricing comparison app designed to help users find the best prices for their prescriptions across different pharmacies. With its user-friendly interface, QualityRx empowers users to make informed decisions about their healthcare expenses by comparing medication prices at local pharmacies.

## Table of Contents

- [About](#about)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Contact](#contact)

## About

QualityRx provides a seamless way to search and compare medication prices, helping users to discover the most cost-effective options for their prescriptions. The app aims to assist in reducing healthcare expenses through informed decision-making.

## Technologies Used

- **Backend:**
  - Node.js
  - Express
  - PostgreSQL
  - JWT for authentication
  - Bcrypt for password hashing

- **Frontend:**
  - React
  - Axios for API requests
  - React Router for navigation

- **Data Source:**
  - Utilizes the Drugs@FDA: Data Import Utility for medication data (https://github.com/jason-fries/drugsatfda-db)

## Features

- User authentication (Login/Registration)
- Search functionality for medications
- Price comparison across different pharmacies
- User profile management
- Secure handling of user data

## Getting Started

These instructions will help you set up and run QualityRx on your local machine for development and testing purposes.

### Prerequisites

- Node.js
- PostgreSQL
- npm (Node Package Manager)

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
   npm start
   ```
7. Start the frontend application
   ```bash
   cd frontend
   npm start
   ```

## Usage

After installation, you can use QualityRx to search for medications, compare prices, and manage your user account.

<!-- ## API Endpoints

List and describe the available API endpoints for the backend, including methods, request parameters, and expected responses.

## Contributing

Guidelines for contributing to the project, including how to submit pull requests, report bugs, and suggest enhancements.

## Acknowledgments

Thank any individuals, organizations, or resources that were instrumental in the development of your project.
 -->
