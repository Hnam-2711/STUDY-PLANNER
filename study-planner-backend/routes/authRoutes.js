// routes/authRoutes.js
const express = require('express');
const router = express.Router();
const sql = require('mssql');
const bcrypt = require('bcryptjs');
const connectDB = require('../config/db');

// ======================= ĐĂNG KÝ NGƯỜI DÙNG =======================
router.post('/register', async (req, res) => {
  const { ho, ten, email, sdt, matkhau } = req.body;

  // Kiểm tra dữ liệu đầu vào
  if (!ho || !ten || !matkhau || (!email && !sdt)) {
    return res.status(400).json({ message: 'Thiếu thông tin bắt buộc' });
  }

  try {
    const pool = await connectDB();

    // Kiểm tra người dùng đã tồn tại chưa
    const checkUser = await pool.request()
      .input('email', sql.NVarChar, email || '')
      .input('sdt', sql.NVarChar, sdt || '')
      .query(`
        SELECT * FROM nguoidung
        WHERE (email = @email AND @email != '')
           OR (sdt = @sdt AND @sdt != '')
      `);

    if (checkUser.recordset.length > 0) {
      return res.status(409).json({ message: 'Email hoặc SĐT đã tồn tại' });
    }

    // Mã hóa mật khẩu
    const hashedPassword = await bcrypt.hash(matkhau, 10);

    // Nếu email không có, để NULL (tránh lỗi UNIQUE NULL)
    const emailValue = email && email.trim() !== '' ? email : null;
    const sdtValue = sdt && sdt.trim() !== '' ? sdt : null;

    // Thêm người dùng mới
    await pool.request()
      .input('ho', sql.NVarChar, ho)
      .input('ten', sql.NVarChar, ten)
      .input('email', sql.NVarChar, emailValue)
      .input('sdt', sql.NVarChar, sdtValue)
      .input('matkhau', sql.NVarChar, hashedPassword)
      .query(`
        INSERT INTO nguoidung (ho, ten, email, sdt, matkhau)
        VALUES (@ho, @ten, @email, @sdt, @matkhau)
      `);

    res.status(201).json({ message: 'Đăng ký thành công' });
  } catch (err) {
    console.error('❌ Lỗi khi đăng ký:', err);
    // Ghi rõ lỗi SQL nếu có
    if (err.originalError && err.originalError.info) {
      return res.status(500).json({
        message: 'Lỗi SQL Server',
        error: err.originalError.info.message
      });
    }
    res.status(500).json({ message: 'Lỗi server', error: err.message });
  }
});

module.exports = router;
