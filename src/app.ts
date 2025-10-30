import express from 'express';

type Request = express.Request;
type Response = express.Response;
type NextFunction = express.NextFunction;
import dotenv from 'dotenv';
import dataRoutes from './routes/dataRoutes';
import pool from './config/db';

// Load environment variables
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Test database connection
const testConnection = async (): Promise<boolean> => {
  try {
    const connection = await pool.getConnection();
    console.log('✅ Database connected successfully');
    connection.release();
    return true;
  } catch (error: any) {
    console.error('❌ Database connection failed:', error.message);
    return false;
  }
};

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use('/api/data', dataRoutes);

// Health check endpoint
app.get('/health', (req: Request, res: Response) => {
  res.status(200).json({
    success: true,
    message: 'Server is running',
    timestamp: new Date().toISOString()
  });
});

// 404 handler
app.use((req: Request, res: Response) => {
  res.status(404).json({
    success: false,
    message: 'Endpoint not found',
    data: null
  });
});

// Error handling middleware
app.use((error: Error, req: Request, res: Response, next: NextFunction) => {
  console.error('Error:', error);
  res.status(500).json({
    success: false,
    message: 'Internal server error',
    data: null
  });
});

// Start server
const startServer = async (): Promise<void> => {
  try {
    // Test database connection
    await testConnection();
    
    app.listen(PORT, () => {
      console.log(`🚀 Server running on http://localhost:${PORT}`);
      console.log(`📚 API Documentation:`);
      console.log(`   GET    /api/data     - Get all modules`);
      console.log(`   GET    /api/data/:id - Get module by ID`);
      console.log(`   POST   /api/data     - Create new module`);
      console.log(`   PATCH  /api/data/:id - Update module`);
      console.log(`   DELETE /api/data/:id - Delete module`);
      console.log(`   GET    /health       - Health check`);
    });
  } catch (error) {
    console.error('Failed to start server:', error);
    process.exit(1);
  }
};

startServer();