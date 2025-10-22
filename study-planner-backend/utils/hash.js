// utils/hash.js
// wrapper cho bcrypt để hash mật khẩu & so sánh
const bcrypt = require('bcrypt');
const SALT_ROUNDS = 10; // số vòng mã hóa

// Hàm mã hóa mật khẩu
async function hashPassword(plain) {
  return bcrypt.hash(plain, SALT_ROUNDS);
}

// Hàm kiểm tra mật khẩu khi đăng nhập
async function comparePassword(plain, hashed) {
  return bcrypt.compare(plain, hashed);
}

module.exports = { hashPassword, comparePassword };
