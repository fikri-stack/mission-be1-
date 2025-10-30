import pool from './config/db.ts';

try {
  const [rows] = await pool.query('SELECT NOW() AS time_now');
  console.log('✅ Connected to MySQL! Current time:', rows[0].time_now);
} catch (error) {
  console.error('❌ Database connection failed:', error);
}
