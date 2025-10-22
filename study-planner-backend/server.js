// server.js
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const connectDB = require('./config/db');
const authRoutes = require('./routes/authRoutes');

const app = express();
const PORT = process.env.PORT || 4000;

//  Middleware
app.use(cors());
app.use(express.json());        // ✅ Cho phép đọc dữ liệu JSON từ frontend
app.use(bodyParser.json());     // ✅ Dự phòng (tương thích cũ)

//  Kết nối database
connectDB()
  .then(() => console.log('✅ Kết nối SQL Server thành công!'))
  .catch((err) => console.error('❌ Lỗi kết nối SQL Server:', err));

//  Các route liên quan đến đăng nhập / đăng ký
app.use('/auth', authRoutes);

//  Route kiểm tra hoạt động
app.get('/', (req, res) => {
  res.send('✅ API backend đang hoạt động!');
});

// 🚀 Khởi động server
app.listen(PORT, () => {
  console.log(`🚀 Server đang chạy tại: http://localhost:${PORT}`);
});
