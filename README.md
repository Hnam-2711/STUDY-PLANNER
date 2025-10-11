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

  <!-- ---------- FORM TẠO TÀI KHOẢN ---------- -->
<div class="register-box" style="display: none;">
  <h2>Tạo tài khoản mới</h2>
  <div class="name-inputs">
    <input type="text" placeholder="Họ">
    <input type="text" placeholder="Tên">
  </div>
  <input type="text" placeholder="Email hoặc số điện thoại">
  <input type="password" placeholder="Mật khẩu mới">
  <button class="btn-confirm">Xác nhận</button>
</div>

<script>
  // Khi bấm vào "Tạo tài khoản"
  const btnRegister = document.querySelector(".btn-register");
  const loginBox = document.querySelector(".login-box");
  const registerBox = document.querySelector(".register-box");

  btnRegister.addEventListener("click", () => {
    loginBox.style.display = "none";       // Ẩn khung đăng nhập
    registerBox.style.display = "flex";    // Hiện khung tạo tài khoản
  });
</script>

<style>
  /* ---------- KHUNG TẠO TÀI KHOẢN ---------- */
 .register-box {
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 25px;
  padding: 50px 60px;
  width: 100%;
  max-width: 420px;
  box-shadow: 0 4px 25px rgba(0,0,0,0.15);
  flex-direction: column;
  align-items: stretch;
  position: relative;
  left: -100px; 
}


  .register-box h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #000;
  }

  .register-box input {
    width: 100%;
    padding: 20px;
    margin: 8px 0;
    border: 2px solid #000;
    border-radius: 10px;
    font-size: 18px;
    box-sizing: border-box;
  }

  .register-box .name-inputs {
    display: flex;
    gap: 10px;
  }

  .register-box .name-inputs input {
    flex: 1;
  }

  .btn-confirm {
    background-color: #11468F;
    color: white;
    font-weight: bold;
    padding: 15px;
    border: none;
    border-radius: 10px;
    font-size: 18px;
    cursor: pointer;
    margin-top: 15px;
  }

  .btn-confirm:hover {
    background-color: #0d3870;
  }
</style>
<!-- ---------- FORM NHẬP MÃ BẢO MẬT ---------- -->
<div class="verify-box" style="display: none;">
  <h2>Vui lòng nhập mã bảo mật</h2>
  <p>Vui lòng kiểm tra mã trong email của bạn. Mã này gồm 6 số.</p>

  <div class="verify-inputs">
    <input type="text" placeholder="Nhập mã">
    <div class="sent-email">
      Chúng tôi đã gửi mã cho bạn 
    </div>
  </div>

  <button class="btn-verify">Xác nhận</button>
</div>

<script>
  // Khi bấm "Xác nhận" trong khung tạo tài khoản
  const btnConfirm = document.querySelector(".btn-confirm");
  const verifyBox = document.querySelector(".verify-box");

  btnConfirm.addEventListener("click", () => {
    document.querySelector(".register-box").style.display = "none"; // Ẩn khung tạo tài khoản
    verifyBox.style.display = "flex"; // Hiện khung nhập mã bảo mật
  });
</script>

<style>
  /* ---------- KHUNG NHẬP MÃ BẢO MẬT ---------- */
  .verify-box {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 25px;
    padding: 50px 60px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 4px 25px rgba(0,0,0,0.15);
    flex-direction: column;
    align-items: stretch;
    position: relative;
    left: -100px; /* dịch sang phải cho cân */
  }

  .verify-box h2 {
    text-align: center;
    margin-bottom: 10px;
    color: #000;
  }

  .verify-box p {
    text-align: center;
    margin-bottom: 25px;
    font-size: 16px;
  }

  .verify-box .verify-inputs {
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .verify-box input {
    flex: 1;
    padding: 20px;
    border: 2px solid #000;
    border-radius: 10px;
    font-size: 18px;
  }

  .verify-box .sent-email {
    font-size: 14px;
  }

  .btn-verify {
    background-color: #11468F;
    color: white;
    font-weight: bold;
    padding: 15px;
    border: none;
    border-radius: 10px;
    font-size: 18px;
    cursor: pointer;
    margin-top: 20px;
  }

  .btn-verify:hover {
    background-color: #0d3870;
  }
</style>

<!-- nếu bạn chưa có success-box HTML/CSS --> 
<div class="success-box" style="display: none;">
  <h2>Tạo tài khoản mới thành công.</h2>
  <p>Vui lòng quay lại trang đăng nhập.</p>
  <button class="btn-back-login">Đăng nhập</button>
</div>

<style>
  .success-box {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 25px;
    padding: 50px 60px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 4px 25px rgba(0,0,0,0.15);
    flex-direction: column;
    align-items: center;
    text-align: center;
    position: relative;
    left: -100px;
  }
  .success-box h2 { margin-bottom: 10px; color: #000; }
  .success-box p { font-size: 16px; margin-bottom: 25px; }
  .btn-back-login {
    background-color: #11468F;
    color: white;
    font-weight: bold;
    padding: 15px;
    border: none;
    border-radius: 10px;
    font-size: 18px;
    cursor: pointer;
    width: 100%;
  }
  .btn-back-login:hover { background-color: #0d3870; }
</style>

<script>
  // Intercept click on nút "Xác nhận" (btn-verify) ở capture phase để ngăn handler cũ
  (function() {
    const verifyButton = document.querySelector(".btn-verify");
    const successBox = document.querySelector(".success-box");
    const verifyBox = document.querySelector(".verify-box");
    const loginBox = document.querySelector(".login-box");

    if (!verifyButton || !successBox || !verifyBox || !loginBox) return;

    // Capture listener: chạy trước mọi listener khác, chặn chúng, và hiện success-box
    function interceptVerify(e) {
      // chặn mọi handler khác (bao gồm handler gốc của bạn)
      e.stopImmediatePropagation();
      e.preventDefault();

      // ẩn khung nhập mã, hiển thị khung success
      verifyBox.style.display = "none";
      successBox.style.display = "flex";

      // gỡ listener capture để không can thiệp lần sau (nếu cần)
      verifyButton.removeEventListener("click", interceptVerify, true);
    }

    verifyButton.addEventListener("click", interceptVerify, true); // true = capture

    // Nút "Đăng nhập" trong success-box → quay về khung đăng nhập
    const backLoginBtn = document.querySelector(".btn-back-login");
    if (backLoginBtn) {
      backLoginBtn.addEventListener("click", () => {
        successBox.style.display = "none";
        loginBox.style.display = "flex";
      });
    }
  })();
</script>


<!-- ---------- NÚT CHUYỂN NGÔN NGỮ ---------- -->
<div id="lang-switch" style="
  position: absolute;
  top: 25px;
  right: 35px;
  font-weight: bold;
  font-size: 18px;
  cursor: pointer;
  color: #11468F;
">VIE</div>

<script>
  const langSwitch = document.getElementById("lang-switch");
  let isVietnamese = true;

  langSwitch.addEventListener("click", () => {
    isVietnamese = !isVietnamese;
    langSwitch.textContent = isVietnamese ? "VIE" : "ENG";

    // Cập nhật nội dung
    const loginBtn = document.querySelector(".btn-login");
    const registerBtn = document.querySelector(".btn-register");
    const forgot = document.querySelector(".forgot");
    const inputs = document.querySelectorAll(".login-box input");

    if (isVietnamese) {
      inputs[0].placeholder = "Email hoặc số điện thoại";
      inputs[1].placeholder = "Mật khẩu";
      loginBtn.textContent = "Đăng nhập";
      registerBtn.textContent = "Tạo tài khoản";
      forgot.textContent = "Quên mật khẩu";
    } else {
      inputs[0].placeholder = "Email or phone number";
      inputs[1].placeholder = "Password";
      loginBtn.textContent = "Log in";
      registerBtn.textContent = "Sign up";
      forgot.textContent = "Forgot password";
    }
  });
</script>



</body>
</html>

