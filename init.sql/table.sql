-- ============================================
-- LEARNING MANAGEMENT SYSTEM DATABASE
-- ============================================

-- Tabel USER
CREATE TABLE USER (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabel TUTOR
CREATE TABLE TUTOR (
    tutor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    bio TEXT,
    company VARCHAR(255),
    position VARCHAR(255),
    photo VARCHAR(255)
);

-- Tabel CATEGORY
CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Tabel MODULES
CREATE TABLE MODULES (
    module_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    tutor_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    duration INT COMMENT 'in minutes',
    image VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
    FOREIGN KEY (tutor_id) REFERENCES TUTOR(tutor_id)
);

-- Tabel MATERIALS
CREATE TABLE MATERIALS (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    module_id INT NOT NULL,
    type ENUM('video', 'document') NOT NULL,
    title VARCHAR(255) NOT NULL,
    content_url VARCHAR(255) NOT NULL,
    sequence INT NOT NULL,
    duration INT COMMENT 'for video',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id)
);

-- Tabel REVIEW
CREATE TABLE REVIEW (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id)
);

-- Tabel CERTIFICATE
CREATE TABLE CERTIFICATE (
    certificate_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    issue_number VARCHAR(100),
    issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    final_score DECIMAL(5,2),
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id)
);

-- Tabel PRETEST
CREATE TABLE PRETEST (
    pretest_id INT PRIMARY KEY AUTO_INCREMENT,
    module_id INT NOT NULL,
    question TEXT NOT NULL,
    options JSON COMMENT 'array of choices',
    correct_answer VARCHAR(255) NOT NULL,
    order_number INT NOT NULL,
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id)
);

-- Tabel QUIZ
CREATE TABLE QUIZ (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    materials_id INT NOT NULL,
    question TEXT NOT NULL,
    options JSON COMMENT 'array of choices',
    correct_answer VARCHAR(255) NOT NULL,
    order_number INT NOT NULL,
    FOREIGN KEY (materials_id) REFERENCES MATERIALS(material_id)
);

-- Tabel PROGRESS
CREATE TABLE PROGRESS (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    materials_id INT NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    completion_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (materials_id) REFERENCES MATERIALS(material_id)
);

-- Tabel ENROLLMENT
CREATE TABLE ENROLLMENT (
    user_module_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'completed') DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id),
    UNIQUE KEY unique_enrollment (user_id, module_id)
);

-- Tabel ORDER
CREATE TABLE `ORDER` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'success', 'failed') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (module_id) REFERENCES MODULES(module_id)
);

-- Tabel PAYMENT
CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(255),
    status ENUM('pending', 'success', 'failed') DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES `ORDER`(order_id)
);

-- Tabel PRETEST_RESULT
CREATE TABLE PRETEST_RESULT (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    pretest_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    answers JSON COMMENT 'user answers',
    taken_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (pretest_id) REFERENCES PRETEST(pretest_id)
);

-- ============================================
-- INDEXES untuk optimasi query
-- ============================================

CREATE INDEX idx_user_email ON USER(email);
CREATE INDEX idx_user_role ON USER(role);
CREATE INDEX idx_modules_category ON MODULES(category_id);
CREATE INDEX idx_modules_tutor ON MODULES(tutor_id);
CREATE INDEX idx_materials_module ON MATERIALS(module_id);
CREATE INDEX idx_review_module ON REVIEW(module_id);
CREATE INDEX idx_review_user ON REVIEW(user_id);
CREATE INDEX idx_enrollment_user ON ENROLLMENT(user_id);
CREATE INDEX idx_enrollment_module ON ENROLLMENT(module_id);
CREATE INDEX idx_order_user ON `ORDER`(user_id);
CREATE INDEX idx_payment_order ON PAYMENT(order_id);
CREATE INDEX idx_progress_user ON PROGRESS(user_id);