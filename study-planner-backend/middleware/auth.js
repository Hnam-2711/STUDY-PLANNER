const sql = require("mssql");
const bcrypt = require("bcrypt");

// Cấu hình kết nối SQL Server (sửa đúng theo config của bạn)
const dbConfig = {
  user: "truc",
  password: "0109", // sửa đúng mật khẩu SQL Server
  server: "localhost",
  database: "study_planner", // tên database
  options: {
    encrypt: false,
    trustServerCertificate: true,
  },
};

// -----------------------------
// 🟢 API Đăng ký người dùng
// -----------------------------
async function registerUser(req, res) {
  try {
    const { ho, ten, email, sdt, matkhau } = req.body;

    if (!ho || !ten || (!email && !sdt) || !matkhau) {
      return res.status(400).json({ message: "Thiếu thông tin đăng ký" });
    }

    const pool = await sql.connect(dbConfig);

    // Kiểm tra trùng email hoặc số điện thoại
    const checkUser = await pool
      .request()
      .input("email", sql.NVarChar, email || null)
      .input("sdt", sql.NVarChar, sdt || null)
      .query(
        "SELECT * FROM nguoidung WHERE email = @email OR sdt = @sdt"
      );

    if (checkUser.recordset.length > 0) {
      return res.status(400).json({ message: "Email hoặc số điện thoại đã tồn tại" });
    }

    const hashedPassword = await bcrypt.hash(matkhau, 10);

    // Thêm người dùng
    await pool
      .request()
      .input("ho", sql.NVarChar, ho)
      .input("ten", sql.NVarChar, ten)
      .input("email", sql.NVarChar, email || null)
      .input("sdt", sql.NVarChar, sdt || null)
      .input("matkhau", sql.NVarChar, hashedPassword)
      .query(`
        INSERT INTO nguoidung (ho, ten, email, sdt, matkhau, lang)
        VALUES (@ho, @ten, @email, @sdt, @matkhau, 'vi')
      `);

    res.status(201).json({ message: "Đăng ký thành công!" });
  } catch (err) {
    console.error("Lỗi khi đăng ký:", err);
    res.status(500).json({ message: "Lỗi server" });
  }
}

// -----------------------------
// 🟢 API Đăng nhập
// -----------------------------
async function loginUser(req, res) {
  try {
    const { email, sdt, matkhau } = req.body;

    if ((!email && !sdt) || !matkhau) {
      return res.status(400).json({ message: "Thiếu thông tin đăng nhập" });
    }

    const pool = await sql.connect(dbConfig);

    const result = await pool
      .request()
      .input("email", sql.NVarChar, email || null)
      .input("sdt", sql.NVarChar, sdt || null)
      .query(
        "SELECT * FROM nguoidung WHERE email = @email OR sdt = @sdt"
      );

    if (result.recordset.length === 0) {
      return res.status(404).json({ message: "Không tìm thấy tài khoản" });
    }

    const user = result.recordset[0];
    const isMatch = await bcrypt.compare(matkhau, user.matkhau);

    if (!isMatch) {
      return res.status(401).json({ message: "Sai mật khẩu" });
    }

    res.status(200).json({ message: "Đăng nhập thành công", user });
  } catch (err) {
    console.error("Lỗi khi đăng nhập:", err);
    res.status(500).json({ message: "Lỗi server" });
  }
}

module.exports = { registerUser, loginUser };
