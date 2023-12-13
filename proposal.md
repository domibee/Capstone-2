
1. **Goal of the Website:**
   - The website aims to offer a seamless platform for users to search for medications, compare prices from different pharmacies, and potentially find discounts. The primary goal is to simplify the process of obtaining affordable medications.

2. **User Demographics:**
   - The target audience includes individuals seeking affordable medications, caregivers, and healthcare professionals. The website is designed to be accessible and useful for a diverse demographic.

3. **Data Usage:**
   - The website plans to use data related to medications, pharmacies, and user information. Utilizing the Open FDA API for drug information, the data will include medication details such as brand name, generic name, dosage, and adverse event information. The PostgreSQL database schema will include tables like `Medications`, `Pharmacies`, `Users`, and `Prices`. 

   - **Example Database Schema:**
     - Medications Table:
       - `id` (Primary Key)
       - `brand_name`
       - `generic_name`
       - `dosage`
       - `instructions`
       - `adverse_events` (Link to adverse events from Open FDA)

     - Pharmacies Table:
       - `id` (Primary Key)
       - `name`
       - `location`

     - Users Table:
       - `id` (Primary Key)
       - `username`
       - `password` (Hashed)
       - `email`

     - Prices Table:
       - `id` (Primary Key)
       - `medication_id` (Foreign Key)
       - `pharmacy_id` (Foreign Key)
       - `price`

4. **Approach to Project:**
   - a. **Database Schema:**
      - The database schema is designed to establish relationships between medications, pharmacies, users, and prices. For instance, the `Prices` table has foreign keys linking to the `Medications` and `Pharmacies` tables.

   - b. **API Challenges:**
      - Challenges might include mapping the Open FDA API's drug information to fit the database schema and handling the dynamic nature of adverse event data.

   - c. **Sensitive Information:**
      - Sensitive information like user passwords will be securely stored and handled. Security measures will be implemented, including encryption and secure authentication.

   - d. **Functionality:**
      - Core functionalities include medication search, price comparison, user account creation, and preference saving. The Node.js and Express backend will handle these functionalities, interacting with the PostgreSQL database.

   - e. **User Flow:**
      - Users will initiate a search for a specific medication, view prices from different pharmacies, and have the option to create accounts to save preferences. The user flow is designed to be intuitive and user-friendly, facilitated by the React frontend.

   - f. **Beyond CRUD:**
      - The website goes beyond basic CRUD operations by incorporating features like user accounts, personalized preferences, and leveraging the Open FDA API for adverse event information, enriching the user experience.
