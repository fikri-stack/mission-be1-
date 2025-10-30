import pool from '../config/db';

interface ModuleData {
  category_id: number;
  tutor_id: number;
  title: string;
  description?: string;
  price: number;
  duration?: number;
  image?: string;
}

class DataService {
  /**
   * Get all modules
   * @returns {Promise<Array>} Array of modules
   */
  static async getAllData(): Promise<any[]> {
    try {
      const [rows] = await pool.execute('SELECT * FROM MODULES ORDER BY created_at DESC');
      return rows as any[];
    } catch (error: any) {
      throw new Error(`Failed to fetch data: ${error.message}`);
    }
  }

  /**
   * Get module by ID
   * @param {number} id - Module ID
   * @returns {Promise<Object|null>} Module object or null
   */
  static async getDataById(id: number): Promise<any | null> {
    try {
      const [rows] = await pool.execute('SELECT * FROM MODULES WHERE module_id = ?', [id]);
      const result = rows as any[];
      return result.length > 0 ? result[0] : null;
    } catch (error: any) {
      throw new Error(`Failed to fetch data by ID: ${error.message}`);
    }
  }

  /**
   * Get modules by attribute
   * @param {string} attribute - Column name
   * @param {any} value - Value to search
   * @returns {Promise<Array>} Array of modules
   */
  static async getDataByAttribute(attribute: string, value: any): Promise<any[]> {
    try {
      const allowedAttributes = ['title', 'price', 'duration'];
      if (!allowedAttributes.includes(attribute)) {
        throw new Error('Invalid attribute');
      }
      
      const query = `SELECT * FROM MODULES WHERE ${attribute} LIKE ? ORDER BY created_at DESC`;
      const [rows] = await pool.execute(query, [`%${value}%`]);
      return rows as any[];
    } catch (error: any) {
      throw new Error(`Failed to fetch data by attribute: ${error.message}`);
    }
  }

  /**
   * Insert new module
   * @param {Object} data - Module data
   * @returns {Promise<Object>} Created module
   */
  static async insertData(data: ModuleData): Promise<any> {
    try {
      const { category_id, tutor_id, title, description, price, duration, image } = data;
      const query = 'INSERT INTO MODULES (category_id, tutor_id, title, description, price, duration, image) VALUES (?, ?, ?, ?, ?, ?, ?)';
      const [result] = await pool.execute(query, [category_id, tutor_id, title, description, price, duration, image]);
      
      return await this.getDataById((result as any).insertId);
    } catch (error: any) {
      throw new Error(`Failed to insert data: ${error.message}`);
    }
  }

  /**
   * Update module by ID
   * @param {number} id - Module ID
   * @param {Object} data - Updated module data
   * @returns {Promise<Object|null>} Updated module or null
   */
  static async updateData(id: number, data: ModuleData): Promise<any | null> {
    try {
      const { category_id, tutor_id, title, description, price, duration, image } = data;
      const query = 'UPDATE MODULES SET category_id = ?, tutor_id = ?, title = ?, description = ?, price = ?, duration = ?, image = ? WHERE module_id = ?';
      const [result] = await pool.execute(query, [category_id, tutor_id, title, description, price, duration, image, id]);
      
      if ((result as any).affectedRows === 0) {
        return null;
      }
      
      return await this.getDataById(id);
    } catch (error: any) {
      throw new Error(`Failed to update data: ${error.message}`);
    }
  }

  /**
   * Delete module by ID
   * @param {number} id - Module ID
   * @returns {Promise<boolean>} Success status
   */
  static async deleteData(id: number): Promise<boolean> {
    try {
      const [result] = await pool.execute('DELETE FROM MODULES WHERE module_id = ?', [id]);
      return (result as any).affectedRows > 0;
    } catch (error: any) {
      throw new Error(`Failed to delete data: ${error.message}`);
    }
  }
}

export default DataService;