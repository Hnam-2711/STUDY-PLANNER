# STUDY-PLANNER
Dự án phần mềm: Quản lí và tính toán kết quả học tập
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Study Planner - Đăng nhập</title>
  <style>
    /* ---------- CÀI ĐẶT CHUNG ---------- */
    body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background-image: url("https://xdcs.cdnchinhphu.vn/446259493575335936/2023/8/22/tla-16927191259151174443421.jpg"); /* ảnh nền */
      background-size: cover;
      background-position: center;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      backdrop-filter: blur(4px);
    }

    /* ---------- KHUNG TỔNG CHIA 2 BÊN ---------- */
    .container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 80%;
      max-width: 1100px;
    }

    /* ---------- PHẦN TRÁI ---------- */
    .left {
      color: #0b132b;
      font-weight: bold;
    }

    .left h1 {
      font-size: 80px;
      line-height: 1.1;
      margin: 0;
    }

    .icons {
      margin-top: 20px;
      font-size: 40px;
    }

    /* ---------- PHẦN PHẢI: KHUNG TRẮNG ---------- */
    .right {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 50%;
    }

    /* ---------- HỘP TRẮNG ĐĂNG NHẬP ---------- */
    .login-box {
      background-color: rgba(255, 255, 255, 0.9); /* trắng trong suốt */
      border-radius: 25px;
      padding: 70px 65px; /* padding cân đối để khung không quá to */
      width: 100%;
      max-width: 420px;
      box-shadow: 0 4px 25px rgba(0,0,0,0.15);
      backdrop-filter: blur(4px);
      display: flex;
      flex-direction: column;
      align-items: stretch; /* giúp input vừa khít khung */
    }

    /* ---------- Ô NHẬP EMAIL / MẬT KHẨU ---------- */
    .login-box input {
      width: 100%;             /* ô nhập vừa khít chiều ngang khung */
      padding: 25px 20px;      /* khoảng trong của chữ trong ô */
      margin: 8px 0;           /* khoảng cách giữa 2 ô */
      border: 2px solid #000;  /* viền đen */
      border-radius: 10px;
      font-size: 18px;
      outline: none;
      box-sizing: border-box;  /* tính cả viền vào kích thước tổng */
    }

    /* ---------- NÚT CHUNG ---------- */
    .login-box button {
      width: 100%;
      padding: 15px;
      border: none;
      border-radius: 10px;
      font-size: 18px;
      color: white;
      font-weight: bold;
      cursor: pointer;
      box-sizing: border-box;
    }

    /* ---------- NÚT ĐĂNG NHẬP ---------- */
    .btn-login {
      background-color: #11468F;
      margin-top: 15px;
    }

    .btn-login:hover {
      background-color: #0d3870;
    }

    /* ---------- LIÊN KẾT QUÊN MẬT KHẨU ---------- */
    .forgot {
      margin-top: 10px;
      display: block;
      color: #11468F;
      text-align: center;
      text-decoration: none;
      font-size: 15px;
    }

    .forgot:hover {
      text-decoration: underline;
    }

    /* ---------- NÚT TẠO TÀI KHOẢN ---------- */
    .btn-register {
      background-color: #00A651;
      margin-top: 15px;
    }

    .btn-register:hover {
      background-color: #008f45;
    }
  </style>
</head>
<body>

  <div class="container">
    <!-- PHẦN TRÁI -->
    <div class="left">
      <h1>STUDY<br>PLANNER</h1>
      <div class="icons">
        📚 🎯 📅
      </div>
    </div>

    <!-- PHẦN PHẢI: KHUNG TRẮNG -->
    <div class="right">
      <div class="login-box">
        <input type="text" placeholder="Email hoặc số điện thoại"> <!-- ô nhập email -->
        <input type="password" placeholder="Mật khẩu"> <!-- ô nhập mật khẩu -->

        <button class="btn-login">Đăng nhập</button> <!-- nút đăng nhập -->
        <a href="#" class="forgot">Quên mật khẩu</a> <!-- dòng chữ quên mật khẩu -->
        <button class="btn-register">Tạo tài khoản</button> <!-- nút tạo tài khoản -->
      </div>
    </div>
  </div>

</body>
</html>
