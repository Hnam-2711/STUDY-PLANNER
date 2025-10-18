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

<!-- Ẩn toàn bộ khung quên mật khẩu khi chưa bấm -->
<style>
  .box { 
    display: none; 
    background-color: rgba(255,255,255,0.9);
    border-radius: 25px;
    padding: 40px 50px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 4px 25px rgba(0,0,0,0.15);
    flex-direction: column;
    align-items: stretch;
    text-align: center;
    margin: auto;
  }
  .box.active { display: flex; }
  .box input {
    margin: 10px 0;
    padding: 15px;
    border: 2px solid #000;
    border-radius: 10px;
    font-size: 16px;
  }
  .box button {
    background-color: #11468F;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 18px;
    padding: 12px;
    margin-top: 10px;
    cursor: pointer;
  }
  .box button:hover { background-color: #0d3870; }
  .success-icon { font-size: 48px; margin-bottom: 10px; }
</style>

<!-- 4 bước quên mật khẩu -->
<div class="container" id="forgotContainer" style="display: none;">
  <!-- Bước 1 -->
  <div class="box active" id="step1">
    <h2>Tìm tài khoản của bạn</h2>
    <p>Vui lòng nhập email hoặc số điện thoại để tìm tài khoản</p>
    <input type="text" placeholder="Email hoặc số điện thoại">
    <button onclick="nextStep(2)">Xác nhận</button>
  </div>

  <!-- Bước 2 -->
  <div class="box" id="step2">
    <h2>Nhập mã bảo mật</h2>
    <p>Chúng tôi đã gửi mã đến email của bạn</p>
    <input type="text" placeholder="Nhập mã bảo mật">
    <button onclick="nextStep(3)">Xác nhận</button>
  </div>

  <!-- Bước 3 -->
  <div class="box" id="step3">
    <h2>Đặt lại mật khẩu</h2>
    <input type="password" placeholder="Mật khẩu mới">
    <input type="password" placeholder="Xác nhận mật khẩu mới">
    <button onclick="nextStep(4)">Xác nhận</button>
  </div>

  <!-- Bước 4 -->
  <div class="box" id="step4">
    <div class="success-icon">✅</div>
    <h2>Đổi mật khẩu thành công!</h2>
    <button onclick="backToLogin()">Đăng nhập</button>
  </div>
</div>

<script>
  // Ẩn hiện từng bước
  function nextStep(step) {
    document.querySelectorAll('.box').forEach(box => box.classList.remove('active'));
    document.getElementById('step' + step).classList.add('active');
  }

  // Khi bấm vào "Quên mật khẩu"
  const forgotLink = document.querySelector('.forgot');
  const loginbox = document.querySelector('.login-box');
  const forgotContainer = document.getElementById('forgotContainer');

  if (forgotLink) {
    forgotLink.addEventListener('click', function(e) {
      e.preventDefault();
      loginBox.style.display = 'none';
      forgotContainer.style.display = 'block';
      nextStep(1);
    });
  }

  // Khi bấm "Đăng nhập" ở bước cuối
  function backToLogin() {
    forgotContainer.style.display = 'none';
    loginBox.style.display = 'flex';
  }
</script>

<!-- ---------- GIAO DIỆN SAU KHI ĐĂNG NHẬP ---------- -->
<div class="main-menu" style="display: none; text-align:center; background-color:white; height:100vh; width:100vw; flex-direction:column; justify-content:center; align-items:center; position:relative;">

  <!-- 🔹 GÓC TRÁI: STUDY PLANNER VÀ 3 BIỂU TƯỢNG DƯỚI -->
  <div style="position:absolute; top:20px; left:20px; display:flex; flex-direction:column; align-items:flex-start;">
    <h2 style="margin:0; font-size:22px; color:#0b132b; font-weight:700;">Study Planner</h2>
    <div style="margin-top:4px; display:flex; gap:6px; font-size:22px;">
      <span>📚</span>
      <span>🎯</span>
      <span>📅</span>
    </div>
  </div>

  <!-- 🔹 CÁC NÚT CHÍNH Ở GIỮA -->
  <div style="display: grid; grid-template-columns: repeat(2, 250px); gap: 30px; justify-content: center;">
    <button style="background-color:#11468F; color:white; border:none; border-radius:20px; padding:40px 20px; font-size:18px; font-weight:bold; cursor:pointer;">Nhập/Chỉnh sửa danh sách môn học</button>
    <button style="background-color:#00A651; color:white; border:none; border-radius:20px; padding:40px 20px; font-size:18px; font-weight:bold; cursor:pointer;">Đề xuất phương án học tập</button>
    <button style="background-color:#C10000; color:white; border:none; border-radius:20px; padding:40px 20px; font-size:18px; font-weight:bold; cursor:pointer;">Tiến độ học tập</button>
    <button style="background-color:#D2691E; color:white; border:none; border-radius:20px; padding:40px 20px; font-size:18px; font-weight:bold; cursor:pointer;">Gợi ý thời khóa biểu</button>
  </div>
</div>

<script>
  const loginButton = document.querySelector(".btn-login");
  const mainMenu = document.querySelector(".main-menu");

  loginButton.addEventListener("click", () => {
    // Ẩn phần đăng nhập và các khung khác
    document.querySelector(".container").style.display = "none";
    document.querySelectorAll(".register-box, .verify-box, .success-box, #forgotContainer")
      .forEach(box => box.style.display = "none");

    // 🔹 Tắt ảnh nền, để nền trắng
    document.body.style.backgroundImage = "none";
    document.body.style.backdropFilter = "none";
    document.body.style.backgroundColor = "white";

    // Hiện giao diện chính
    mainMenu.style.display = "flex";
  });
</script>

<!-- ========== GIAO DIỆN NHẬP/CHỈNH SỬA DANH SÁCH MÔN HỌC ========== -->
<div class="subject-editor" style="display:none; height:100vh; width:100vw; background-color:white; font-family:'Segoe UI',sans-serif; padding:40px; box-sizing:border-box; position:relative;">

  <!-- Tiêu đề và góc phải -->
  <div style="display:flex; justify-content:space-between; align-items:center;">
    <h1 style="font-size:30px; font-weight:700; color:#0b132b; display:flex; align-items:center; gap:10px;">
      STUDY PLANNER <span style="font-size:22px;">📚 🎯 📅</span>
    </h1>
    <div style="display:flex; align-items:center; gap:10px;">
      <span style="font-size:24px;">🎓</span>
      <span style="color:#11468F; font-weight:bold; cursor:pointer;">VIE</span>
    </div>
  </div>

  <!-- Thanh tiêu đề chính -->
  <div style="text-align:center; margin-top:15px;">
    <button style="background-color:#777; color:white; border:none; border-radius:10px; padding:10px 25px; font-weight:bold; font-size:17px;">
      Nhập/Chỉnh sửa danh sách môn học
    </button>
  </div>

  <!-- Khối nội dung chia 2 bên -->
  <div style="display:flex; justify-content:space-between; align-items:flex-start; margin-top:30px;">
    
    <!-- Cột bên trái -->
    <div style="background-color:#f8f8f8; border-radius:20px; padding:30px; width:38%; box-shadow:0 4px 15px rgba(0,0,0,0.1);">
      <h3 style="margin-top:0;">Thêm môn học mới</h3>
      <input id="subjectName" type="text"style="width:100%; padding:12px; border:2px solid #ccc; border-radius:10px; margin-bottom:15px; font-size:16px;">

      <label><b>Số tín chỉ</b></label>
      <input id="credit" type="number" min="1" max="5" placeholder="1 - 5" style="width:100%; padding:12px; border:2px solid #ccc; border-radius:10px; margin-bottom:15px; font-size:16px;">

      <div style="display:flex; gap:10px;">
        <input id="grade4" type="text" placeholder="Điểm chữ (hệ 4)" style="flex:1; padding:12px; border:2px solid #ccc; border-radius:10px; font-size:16px;">
        <input id="grade10" type="text" placeholder="Điểm hệ 10" style="flex:1; padding:12px; border:2px solid #ccc; border-radius:10px; font-size:16px;">
      </div>

      <input id="semester" type="text" placeholder="HK,Năm Học" style="width:100%; padding:12px; border:2px solid #ccc; border-radius:10px; margin-top:15px; font-size:16px;">

      <button id="addSubject" style="background-color:#00A651; color:white; border:none; border-radius:10px; font-size:18px; font-weight:bold; padding:12px; margin-top:20px; cursor:pointer; width:100%;">
        Thêm
      </button>
    </div>

    <!-- Cột bên phải -->
    <div style="background-color:#f8f8f8; border-radius:20px; padding:30px; width:58%; box-shadow:0 4px 15px rgba(0,0,0,0.1);">
      <h3 style="margin-top:0;">Danh sách môn học hiện tại</h3>
      <table id="subjectTable" style="width:100%; border-collapse:collapse; text-align:center;">
        <thead style="background-color:#e0e0e0;">
          <tr>
            <th style="padding:10px;">STT</th>
            <th style="padding:10px;">Môn học</th>
            <th style="padding:10px;">Số TC</th>
            <th style="padding:10px;">H4</th>
            <th style="padding:10px;">H10</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>

      <div style="display:flex; justify-content:space-between; margin-top:20px; background-color:white; border-radius:10px; padding:10px 20px;">
        <div><b>Tổng tín chỉ tích lũy:</b> <span id="totalTC" style="color:red;">0</span></div>
        <div><b>Điểm hệ 4:</b> <span id="avg4" style="color:red;">0</span></div>
        <div><b>Điểm hệ 10:</b> <span id="avg10" style="color:red;">0</span></div>
      </div>
    </div>
  </div>

  <!-- Chú thích cuối -->
  <p style="color:#0073e6; font-weight:bold; text-align:center; margin-top:25px;">
    Vui lòng nhập tên môn học, số tín chỉ chính xác theo Chương trình Đào tạo<br>
    và nhập chính xác số điểm theo ở hệ chữ và hệ 10 đạt được.
  </p>
</div>

<script>
  // Khi bấm nút "Nhập/Chỉnh sửa danh sách môn học" trong main menu
  const editBtn = document.querySelector(".main-menu button:first-child");
  const subjectEditor = document.querySelector(".subject-editor");

  editBtn.addEventListener("click", () => {
    document.querySelector(".main-menu").style.display = "none";
    subjectEditor.style.display = "block";
  });

  // Thêm môn học
  const addBtn = document.getElementById("addSubject");
  const tableBody = document.querySelector("#subjectTable tbody");
  let count = 0, totalTC = 0, totalH4 = 0, totalH10 = 0;

  addBtn.addEventListener("click", () => {
    const name = document.getElementById("subjectName").value.trim();
    const tc = parseFloat(document.getElementById("credit").value);
    const h4 = parseFloat(document.getElementById("grade4").value);
    const h10 = parseFloat(document.getElementById("grade10").value);

    if (!name || isNaN(tc) || isNaN(h4) || isNaN(h10)) {
      alert("Vui lòng nhập đầy đủ thông tin hợp lệ!");
      return;
    }

    count++;
    const row = document.createElement("tr");
    row.innerHTML = `<td>${count}</td><td>${name}</td><td>${tc}</td><td>${h4}</td><td>${h10}</td>`;
    tableBody.appendChild(row);

    totalTC += tc;
    totalH4 += h4 * tc;
    totalH10 += h10 * tc;

    document.getElementById("totalTC").textContent = totalTC.toFixed(1);
    document.getElementById("avg4").textContent = (totalH4 / totalTC).toFixed(2);
    document.getElementById("avg10").textContent = (totalH10 / totalTC).toFixed(2);

    // Reset form
    document.getElementById("subjectName").value = "";
    document.getElementById("credit").value = "";
    document.getElementById("grade4").value = "";
    document.getElementById("grade10").value = "";
    document.getElementById("semester").value = "";
  });
</script>



</body>
</html>
