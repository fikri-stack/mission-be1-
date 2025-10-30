# REST API - Products Management

REST API untuk operasi CRUD (Create, Read, Update, Delete) menggunakan Node.js, Express.js, dan MySQL.

## Features

- ✅ CRUD Operations (Create, Read, Update, Delete)
- ✅ Input Validation
- ✅ Error Handling
- ✅ Consistent JSON Response Format
- ✅ Environment Configuration
- ✅ Database Connection Pool

## Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MySQL
- **ORM**: mysql2 (Raw SQL)

## Installation

1. Clone repository
```bash
git clone <repository-url>
cd missionbe10
```

2. Install dependencies
```bash
npm install
```

3. Setup environment variables
```bash
cp .env.example .env
```
Edit `.env` file dengan konfigurasi database Anda.

4. Setup database
```bash
# Import SQL script ke MySQL
mysql -u root -p < create_products_table.sql
```

5. Run application
```bash
# Development mode
npm run dev

# Production mode
npm start
```

## API Endpoints

### Base URL: `http://localhost:3000`

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/data` | Get all products |
| GET | `/api/data/:id` | Get product by ID |
| POST | `/api/data` | Create new product |
| PATCH | `/api/data/:id` | Update product |
| DELETE | `/api/data/:id` | Delete product |
| GET | `/health` | Health check |

## Request/Response Examples

### GET /api/data
```json
{
  "success": true,
  "message": "Data retrieved successfully",
  "data": [
    {
      "id": 1,
      "name": "Laptop Gaming",
      "price": 15000000.00,
      "stock": 10,
      "description": "High-performance gaming laptop",
      "created_at": "2025-01-20T10:00:00.000Z"
    }
  ]
}
```

### POST /api/data
**Request Body:**
```json
{
  "name": "New Product",
  "price": 100000,
  "stock": 50,
  "description": "Product description"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Data created successfully",
  "data": {
    "id": 6,
    "name": "New Product",
    "price": 100000.00,
    "stock": 50,
    "description": "Product description",
    "created_at": "2025-01-20T10:30:00.000Z"
  }
}
```

## Testing with Postman

1. Import collection atau buat request manual
2. Set base URL: `http://localhost:3000`
3. Test semua endpoints dengan data yang sesuai

## Project Structure

```
src/
├── config/
│   └── database.js          # Database configuration
├── services/
│   └── dataService.js       # Service layer for DML operations
├── controllers/
│   └── dataController.js    # Controllers for request/response handling
├── routes/
│   └── dataRoutes.js        # Route definitions
└── app.js                   # Main application file
```

## Environment Variables

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=products_db
PORT=3000
NODE_ENV=development
```