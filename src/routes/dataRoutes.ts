import express from 'express';
import DataController from '../controllers/dataController';

const router = express.Router();

// GET /api/data - Get all modules
router.get('/', DataController.getAllData);

// GET /api/data/:id - Get module by ID
router.get('/:id', DataController.getDataById);

// POST /api/data - Create new module
router.post('/', DataController.createData);

// PATCH /api/data/:id - Update module by ID
router.patch('/:id', DataController.updateData);

// DELETE /api/data/:id - Delete module by ID
router.delete('/:id', DataController.deleteData);

export default router;