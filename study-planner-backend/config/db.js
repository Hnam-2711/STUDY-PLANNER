// config/db.js
const sql = require('mssql');

const config = {
  user: 'truc',           // 👉 thay bằng user SQL của bạn
  password: '0109',       // 👉 thay bằng mật khẩu SQL
  server: 'PNTLAP\\SQLEXPRESS',
  database: 'StudyPlanner',
  options: {
    encrypt: false,
    trustServerCertificate: true
  }
};

async function connectDB() {
  try {
    const pool = await sql.connect(config);
    console.log('✅ Kết nối SQL Server thành công!');
    return pool;
  } catch (err) {
    console.error('❌ Lỗi kết nối SQL Server:', err);
    throw err;
  }
}

module.exports = connectDB;
