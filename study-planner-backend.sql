

-- ===========================
-- 2. Bảng nguoidung (gộp info + login)
-- - id: PK tự tăng
-- - ho, ten: tên người dùng
-- - email / sdt: có thể dùng 1 trong 2 để đăng nhập (unique)
-- - matkhau: lưu mật khẩu (bắt buộc mã hóa ở backend)
-- - lang: 'vi' hoặc 'en' (CHECK)
-- ===========================
CREATE TABLE nguoidung (
  id INT IDENTITY(1,1) PRIMARY KEY,       -- id tự tăng
  ho NVARCHAR(50) NOT NULL,               -- Họ
  ten NVARCHAR(50) NOT NULL,              -- Tên
  email NVARCHAR(100) NULL,               -- Email (nếu dùng email)
  sdt NVARCHAR(20) NULL,                  -- Số điện thoại (nếu dùng sđt)
  matkhau NVARCHAR(255) NOT NULL,         -- Mật khẩu (đã hash)
  lang NVARCHAR(3) NOT NULL DEFAULT 'vi', -- Ngôn ngữ mặc định
  reset_token NVARCHAR(255) NULL,         -- Token để khôi phục mật khẩu
  token_expire DATETIME NULL,             -- Hạn của token reset
  CONSTRAINT UQ_nguoidung_email UNIQUE (email),
  CONSTRAINT UQ_nguoidung_sdt UNIQUE (sdt),
  CONSTRAINT CK_nguoidung_email_sdt CHECK (email IS NOT NULL OR sdt IS NOT NULL),
  CONSTRAINT CK_nguoidung_lang CHECK (lang IN ('vi', 'en'))
);
GO


-- ===========================
-- 3. Bảng nhommonhoc (nhóm môn)
-- ===========================
CREATE TABLE nhommonhoc (
    manhom INT IDENTITY(1,1) PRIMARY KEY,
    tennhom NVARCHAR(100) NOT NULL,
    mota NVARCHAR(500) NULL
);
GO

-- ===========================
-- 4. Bảng hocphan (môn học)
-- - mỗi môn thuộc 1 nhommonhoc
-- ===========================
CREATE TABLE hocphan (
    mahp INT IDENTITY(1,1) PRIMARY KEY,
    tenhp NVARCHAR(200) NOT NULL,
    sotinchi INT NOT NULL,
    hocky INT NULL,
    namhoc INT NULL,
    manhom INT NOT NULL,
    FOREIGN KEY (manhom) REFERENCES nhommonhoc(manhom)
);
GO

-- ===========================
-- 5. Bảng diem (điểm thực tế)
-- - lưu điểm giữa kỳ, điểm thi, điểm tổng kết
-- - một user có thể có nhiều bản ghi (học lại nhiều lần)
-- ===========================
CREATE TABLE diem (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,            -- FK -> nguoidung(id)
    mahp INT NOT NULL,                    -- FK -> hocphan(mahp)
    diemqt FLOAT NULL,                    -- điểm quá trình
    diemthi FLOAT NULL,                   -- điểm cuối kỳ
    diemtk FLOAT NULL,                    -- điểm tổng kết (nếu backend tính sẵn)
    xeploai NVARCHAR(20) NULL,            -- chữ (A,B,...), optional
    hocky INT NULL,
    namhoc INT NULL,
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id),
    FOREIGN KEY (mahp) REFERENCES hocphan(mahp)
);
GO

-- ===========================
-- 6. Bảng diemkyvong (điểm kỳ vọng)
-- - student nhập điểm kỳ vọng cho môn (dùng cho dự báo GPA)
-- ===========================
CREATE TABLE diemkyvong (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,            -- FK -> nguoidung(id)
    mahp INT NOT NULL,                    -- FK -> hocphan(mahp)
    diemmongmuon FLOAT NOT NULL,          -- điểm kỳ vọng theo thang 10
    ngaycapnhat DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id),
    FOREIGN KEY (mahp) REFERENCES hocphan(mahp),
    CONSTRAINT UQ_diemkyvong_unique_per_user_course UNIQUE (nguoidung_id, mahp) -- mỗi người 1 dòng/ môn
);
GO

-- ===========================
-- 7. Bảng dexuat_mau (lời khuyên mẫu)
-- - chứa các lời khuyên phân theo ngưỡng GPA
-- ===========================
CREATE TABLE dexuat_mau (
    id INT IDENTITY(1,1) PRIMARY KEY,
    muc_gpa_min FLOAT NOT NULL,  -- ngưỡng min (ví dụ 0.0)
    muc_gpa_max FLOAT NOT NULL,  -- ngưỡng max (ví dụ 2.0)
    noidung NVARCHAR(MAX) NOT NULL
);
GO

-- ===========================
-- 8. Bảng dexuat_nguoidung (lưu lịch sử những đề xuất đã hiển thị/áp dụng)
-- - optional: lưu nếu bạn muốn trace lịch sử
-- ===========================
CREATE TABLE dexuat_nguoidung (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,
    dexuat_mau_id INT NOT NULL,
    ngaytao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id),
    FOREIGN KEY (dexuat_mau_id) REFERENCES dexuat_mau(id)
);
GO

-- ===========================
-- 9. Bảng tiendohoctap (theo dõi tiến độ theo nhóm môn)
-- ===========================
CREATE TABLE tiendohoctap (
    matd INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,
    manhom INT NOT NULL,
    tongsomon INT NULL,
    somonhoanthanh INT NULL,
    phantram FLOAT NULL,
    ngaycapnhat DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id),
    FOREIGN KEY (manhom) REFERENCES nhommonhoc(manhom)
);
GO

-- ===========================
-- 10. Bảng thoikhoabieu (nếu muốn lưu TKB)
-- ===========================
CREATE TABLE thoikhoabieu (
    matkb INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,
    hocky INT NULL,
    namhoc INT NULL,
    chitiet NVARCHAR(MAX) NULL,     -- JSON hoặc mô tả
    ngaytao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id)
);
GO

-- 11. Bảng thongbao

CREATE TABLE thongbao (
    matb INT IDENTITY(1,1) PRIMARY KEY,
    nguoidung_id INT NOT NULL,
    tieude NVARCHAR(200) NOT NULL,
    noidung NVARCHAR(MAX) NOT NULL,
    loaitb NVARCHAR(50) NULL,
    ngaygui DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoidung_id) REFERENCES nguoidung(id)
);
GO

-- ===========================
-- 12. Bảng ngonngu (nếu bạn vẫn muốn tách, nhưng lưu lang trong nguoidung là đủ)
-- (Không cần nếu bạn dùng cột lang trong nguoidung)
-- ===========================
/*
CREATE TABLE ngonngu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    mangonngu NVARCHAR(10) NOT NULL,
    tenngonngu NVARCHAR(50) NOT NULL
);
GO
*/

-- ===========================
-- 13. Seed: thêm lời khuyên mẫu (dexuat_mau) và 1 user demo (mật khẩu phải hash trong production)
-- ===========================
INSERT INTO dexuat_mau (muc_gpa_min, muc_gpa_max, noidung) VALUES
(0.0, 1.99, N'Ưu tiên học lại các môn điểm dưới trung bình; tham gia nhóm học; xin trợ giúp giảng viên.'),
(2.0, 2.49, N'Bổ sung kiến thức cơ bản, làm bài tập nhiều hơn, luyện đề cũ.'),
(2.5, 3.19, N'Tham gia nhóm thảo luận, học nâng cao một vài môn để tăng điểm.'),
(3.2, 3.59, N'Giữ phong độ, tối ưu thời gian ôn thi; cân nhắc tham gia nghiên cứu nhỏ.'),
(3.6, 4.0, N'Tiếp tục nâng cao, đăng ký học thêm chuyên đề hoặc đồ án.');
GO
