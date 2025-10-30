-- ============================================
-- SEED DATA FOR LEARNING MANAGEMENT SYSTEM
-- ============================================

-- Seed data for CATEGORY
INSERT INTO CATEGORY (name, description) VALUES
  ('Design', 'Courses related to UI/UX, graphic design, and visual arts'),
  ('Development', 'Web and mobile application development courses'),
  ('Programming', 'Programming languages and software development'),
  ('Marketing', 'Digital marketing, SEO, and social media strategies'),
  ('Business', 'Business management, entrepreneurship, and finance'),
  ('Photography', 'Photography techniques, videography, and visual storytelling'),
  ('Data Science', 'Data analysis, machine learning, and statistics'),
  ('Personal Development', 'Self-improvement, productivity, and soft skills');

-- Seed data for TUTOR
INSERT INTO TUTOR (name, bio, company, position, photo) VALUES
  (
    'Aulia Rahman',
    'Seorang desainer UI/UX dengan pengalaman lebih dari 5 tahun dalam merancang antarmuka yang intuitif dan estetis untuk berbagai aplikasi mobile dan web.',
    'TechIndo',
    'UI/UX Designer',
    'https://example.com/photos/aulia-rahman.jpg'
  ),
  (
    'Budi Santoso',
    'Web developer full-stack yang ahli dalam pengembangan aplikasi berbasis React, Node.js, dan TypeScript, serta berpengalaman dalam membangun sistem skala besar.',
    'DevJakarta',
    'Senior Web Developer',
    'https://example.com/photos/budi-santoso.jpg'
  ),
  (
    'Citra Dewi',
    'Digital marketer dengan fokus pada strategi media sosial, kampanye iklan digital, dan optimasi konten yang terbukti meningkatkan engagement dan konversi.',
    'SocialBoost',
    'Digital Marketing Specialist',
    'https://example.com/photos/citra-dewi.jpg'
  ),
  (
    'Dian Pratama',
    'Instruktur data science yang berpengalaman dalam mengajar Python, statistik, dan machine learning untuk berbagai latar belakang peserta.',
    'Akademi Data Indonesia',
    'Data Science Instructor',
    'https://example.com/photos/dian-pratama.jpg'
  ),
  (
    'Eka Putri',
    'Videografer profesional yang menguasai teknik pengambilan gambar, editing video, dan storytelling visual untuk konten kreatif dan komersial.',
    'CreativeStudio ID',
    'Videographer',
    'https://example.com/photos/eka-putri.jpg'
  );

-- Seed data for USER
INSERT INTO USER (full_name, email, phone, password, role) VALUES
  (
    'Rizky Maulana',
    'rizky.maulana@example.com',
    '628123456789',
    '$2y$10$abcdefghijklmnopqrstuvwxyz123456', -- hashed password123
    'student'
  ),
  (
    'Siti Nurhaliza',
    'siti.nurhaliza@example.com',
    '628223456789',
    '$2y$10$zyxwvutsrqponmlkjihgfedcba654321', -- hashed rahasia321
    'student'
  ),
  (
    'Ahmad Fauzi',
    'ahmad.fauzi@example.com',
    '628323456789',
    '$2y$10$qwertyuiopasdfghjklzxcvbnm789012', -- hashed fauzi987
    'student'
  ),
  (
    'Dewi Kartika',
    'dewi.kartika@example.com',
    '628423456789',
    '$2y$10$mnbvcxzasdfghjklpoiuytrewq345678', -- hashed kartika456
    'student'
  ),
  (
    'Yusuf Ardiansyah',
    'yusuf.ardiansyah@example.com',
    '628523456789',
    '$2y$10$lkjhgfdsaqwertyuioplmnbvcxz901234', -- hashed supersecure
    'student'
  ),
  (
    'Admin System',
    'admin@lms-system.com',
    '628999999999',
    '$2y$10$adminhashedpassword1234567890', -- hashed admin123
    'admin'
  );

-- Seed data for MODULES
INSERT INTO MODULES (tutor_id, category_id, title, description, price, duration, image) VALUES
  (
    1,
    1,
    'Desain UI/UX untuk Pemula',
    'Kelas ini akan membimbing Anda memahami prinsip desain UI/UX dengan studi kasus langsung dari dunia kerja. Pelajari dasar desain yang menarik dan fungsional dari wireframe hingga prototype interaktif.',
    299000,
    480,
    'https://example.com/images/ui-ux-course.jpg'
  ),
  (
    2,
    2,
    'Membangun Website Modern dengan React',
    'Pelajari cara membangun aplikasi web SPA menggunakan React, React Router, dan integrasi backend sederhana. React dari nol hingga mahir dengan proyek nyata.',
    499000,
    720,
    'https://example.com/images/react-course.jpg'
  ),
  (
    3,
    4,
    'Strategi Digital Marketing 2025',
    'Kuasai teknik pemasaran digital, SEO, media sosial, dan iklan berbayar untuk mendongkrak penjualan online. Tingkatkan bisnismu dengan strategi online terbaru.',
    399000,
    540,
    'https://example.com/images/marketing-course.jpg'
  ),
  (
    4,
    7,
    'Data Science dengan Python',
    'Mulai dari Python dasar hingga proyek prediktif menggunakan Pandas, Scikit-learn, dan Matplotlib. Dari dasar hingga prediksi machine learning.',
    599000,
    900,
    'https://example.com/images/datascience-course.jpg'
  ),
  (
    5,
    6,
    'Teknik Videografi untuk Konten Kreator',
    'Pelajari teknik pengambilan gambar, angle, lighting, dan editing video untuk konten YouTube dan Instagram. Video sinematik dari ponselmu.',
    349000,
    420,
    'https://example.com/images/videography-course.jpg'
  );

-- Seed data for PRETEST
INSERT INTO PRETEST (module_id, question, options, correct_answer, order_number) VALUES
  (
    1,
    'Apa itu wireframe dalam desain UI?',
    '["Sketsa awal struktur tampilan antarmuka", "Tool untuk membuat animasi", "Software desain grafis", "Template website jadi"]',
    'Sketsa awal struktur tampilan antarmuka',
    1
  ),
  (
    2,
    'Apa fungsi dari React useState?',
    '["Untuk menyimpan dan memperbarui state komponen", "Untuk membuat CSS", "Untuk routing halaman", "Untuk menghubungkan ke database"]',
    'Untuk menyimpan dan memperbarui state komponen',
    1
  ),
  (
    3,
    'Apa itu CTR dalam digital marketing?',
    '["Click-Through Rate, rasio klik terhadap jumlah tayangan", "Cost To Revenue", "Customer Total Revenue", "Content Type Rating"]',
    'Click-Through Rate, rasio klik terhadap jumlah tayangan',
    1
  ),
  (
    4,
    'Apa itu supervised learning?',
    '["Algoritma machine learning yang dilatih dengan data berlabel", "Belajar tanpa guru", "Algoritma clustering", "Machine learning tanpa data"]',
    'Algoritma machine learning yang dilatih dengan data berlabel',
    1
  ),
  (
    5,
    'Apa itu rule of thirds dalam videografi?',
    '["Komposisi visual yang membagi frame menjadi 9 bagian", "Aturan lighting 3 lampu", "Format video 3:2", "Durasi video 3 menit"]',
    'Komposisi visual yang membagi frame menjadi 9 bagian',
    1
  );

-- Seed data for MATERIALS
INSERT INTO MATERIALS (module_id, type, title, content_url, sequence, duration) VALUES
  -- Module 1: Desain UI/UX untuk Pemula
  (1, 'video', 'Pengenalan UI/UX', 'https://youtu.be/uiux1', 1, 30),
  (1, 'document', 'Panduan Wireframe', 'https://example.com/docs/wireframe-guide.pdf', 2, NULL),
  (1, 'video', 'Wireframe dan Prototyping', 'https://youtu.be/prototype1', 3, 45),
  (1, 'video', 'Studi Kasus: Redesign App', 'https://youtu.be/casestudy1', 4, 35),

  -- Module 2: Membangun Website Modern dengan React
  (2, 'video', 'Dasar React dan JSX', 'https://youtu.be/reactjsx', 1, 40),
  (2, 'video', 'Components dan Props', 'https://youtu.be/reactprops', 2, 35),
  (2, 'video', 'React Router', 'https://youtu.be/reactrouter', 3, 50),
  (2, 'video', 'State Management dengan useReducer', 'https://youtu.be/usereducer', 4, 55),
  (2, 'document', 'Cheatsheet React Hooks', 'https://example.com/docs/react-hooks.pdf', 5, NULL),
  (2, 'video', 'Project: Build Todo App', 'https://youtu.be/reactproject', 6, 70),

  -- Module 3: Strategi Digital Marketing 2025
  (3, 'video', 'Dasar Digital Marketing', 'https://youtu.be/funnel', 1, 30),
  (3, 'video', 'Strategi Konten Sosial Media', 'https://youtu.be/branding', 2, 45),
  (3, 'document', 'Template Content Calendar', 'https://example.com/docs/content-calendar.xlsx', 3, NULL),
  (3, 'video', 'Facebook & Instagram Ads', 'https://youtu.be/fbads', 4, 50),
  (3, 'video', 'SEO untuk Pemula', 'https://youtu.be/seo101', 5, 40),

  -- Module 4: Data Science dengan Python
  (4, 'video', 'Python untuk Data Science', 'https://youtu.be/listcomp', 1, 60),
  (4, 'video', 'Pandas dan Data Manipulation', 'https://youtu.be/pandas', 2, 70),
  (4, 'document', 'Dataset Practice', 'https://example.com/data/practice-dataset.csv', 3, NULL),
  (4, 'video', 'Visualisasi Data dengan Matplotlib', 'https://youtu.be/matplotlib', 4, 55),
  (4, 'video', 'Model Machine Learning', 'https://youtu.be/overfitting', 5, 80),
  (4, 'video', 'Project: Prediksi Harga Rumah', 'https://youtu.be/mlproject', 6, 90),

  -- Module 5: Teknik Videografi untuk Konten Kreator
  (5, 'video', 'Teknik Pengambilan Gambar', 'https://youtu.be/wbvideo', 1, 35),
  (5, 'video', 'Lighting dan White Balance', 'https://youtu.be/lighting', 2, 30),
  (5, 'video', 'Editing Video Dasar', 'https://youtu.be/cuttocut', 3, 50),
  (5, 'document', 'Preset Color Grading', 'https://example.com/docs/color-presets.zip', 4, NULL),
  (5, 'video', 'Storytelling dalam Video', 'https://youtu.be/storytelling', 5, 40);

-- Seed data for QUIZ (attached to materials)
INSERT INTO QUIZ (materials_id, question, options, correct_answer, order_number) VALUES
  (1, 'Apa perbedaan antara UI dan UX?', '["UI adalah antarmuka, UX adalah pengalaman pengguna", "UI dan UX adalah hal yang sama", "UI untuk mobile, UX untuk web", "UI adalah backend, UX adalah frontend"]', 'UI adalah antarmuka, UX adalah pengalaman pengguna', 1),
  (3, 'Apa itu prototype?', '["Simulasi interaktif dari desain aplikasi", "Versi final aplikasi", "Mockup statis", "Dokumentasi desain"]', 'Simulasi interaktif dari desain aplikasi', 1),
  
  (5, 'Apa itu JSX?', '["Sintaks seperti HTML dalam JavaScript", "Bahasa pemrograman baru", "Framework CSS", "Database query language"]', 'Sintaks seperti HTML dalam JavaScript', 1),
  (7, 'Apa itu React Router?', '["Library routing untuk React", "Tool untuk membuat CSS", "Backend framework", "Database ORM"]', 'Library routing untuk React', 1),
  (8, 'Apa itu useReducer?', '["Hook untuk state kompleks dalam React", "Fungsi untuk reduce array", "Component lifecycle method", "CSS preprocessor"]', 'Hook untuk state kompleks dalam React', 1),
  
  (11, 'Apa itu funnel marketing?', '["Proses menarik prospek hingga konversi", "Tool analytics", "Platform iklan", "Jenis website"]', 'Proses menarik prospek hingga konversi', 1),
  (12, 'Platform mana yang cocok untuk branding visual?', '["Instagram dan Pinterest", "LinkedIn dan Twitter", "WhatsApp dan Telegram", "Email dan SMS"]', 'Instagram dan Pinterest', 1),
  
  (16, 'Apa itu list comprehension di Python?', '["Cara singkat membuat list dari iterable", "Fungsi untuk sorting", "Library machine learning", "Method untuk string"]', 'Cara singkat membuat list dari iterable', 1),
  (20, 'Apa itu overfitting?', '["Model terlalu cocok dengan data latih dan gagal generalisasi", "Model yang tidak akurat", "Teknik preprocessing data", "Algoritma clustering"]', 'Model terlalu cocok dengan data latih dan gagal generalisasi', 1),
  
  (22, 'Apa itu white balance?', '["Pengaturan warna putih dalam video agar terlihat alami", "Brightness video", "Resolusi video", "Frame rate video"]', 'Pengaturan warna putih dalam video agar terlihat alami', 1),
  (24, 'Apa itu cut-to-cut editing?', '["Pemotongan langsung antara dua scene tanpa transisi", "Efek transisi fade", "Slow motion effect", "Color correction technique"]', 'Pemotongan langsung antara dua scene tanpa transisi', 1);

-- Seed data for ENROLLMENT
INSERT INTO ENROLLMENT (user_id, module_id, enrollment_date, status) VALUES
  (1, 1, '2025-01-15 10:30:00', 'completed'),
  (1, 2, '2025-02-01 14:20:00', 'active'),
  (2, 2, '2025-01-20 09:15:00', 'completed'),
  (3, 2, '2025-02-05 16:45:00', 'completed'),
  (4, 2, '2025-02-10 11:00:00', 'active'),
  (5, 3, '2025-01-25 13:30:00', 'active'),
  (1, 3, '2025-02-15 10:00:00', 'active');

-- Seed data for REVIEW
INSERT INTO REVIEW (user_id, module_id, rating, description) VALUES
  (
    1,
    1,
    5,
    'Materi desain UI/UX-nya benar-benar membantu saya memahami proses dari wireframe hingga prototyping. Tutor menjelaskan dengan sangat runtut dan mudah diikuti.'
  ),
  (
    2,
    2,
    5,
    'Kelas ini sangat cocok untuk pemula yang ingin belajar React. Proyek akhirnya menantang tapi bermanfaat. Saya jadi lebih percaya diri membuat aplikasi sendiri.'
  ),
  (
    3,
    2,
    4,
    'Cukup informatif, meski bagian state management agak cepat dijelaskan. Tapi secara keseluruhan, materi dan struktur kelasnya bagus.'
  ),
  (
    4,
    2,
    3,
    'Penjelasan tutor bagus, tapi saya berharap ada lebih banyak sesi praktik langsung. Beberapa bagian terasa terlalu teoritis.'
  ),
  (
    5,
    3,
    4,
    'Kelas ini membuka wawasan saya tentang digital marketing modern. Banyak strategi yang bisa langsung diterapkan, terutama di Instagram dan Tiktok.'
  ),
  (
    1,
    3,
    3,
    'Materinya lumayan, tapi saya merasa visual presentasinya terlalu sederhana. Bisa ditingkatkan lagi di bagian desain slide.'
  );

-- Seed data for ORDER
INSERT INTO `ORDER` (user_id, module_id, datetime, total_price, status) VALUES
  (1, 1, '2025-01-15 10:00:00', 299000, 'success'),
  (1, 2, '2025-02-01 14:00:00', 499000, 'success'),
  (2, 2, '2025-01-20 09:00:00', 499000, 'success'),
  (3, 2, '2025-02-05 16:30:00', 499000, 'success'),
  (4, 2, '2025-02-10 10:45:00', 499000, 'success'),
  (5, 3, '2025-01-25 13:00:00', 399000, 'success'),
  (1, 3, '2025-02-15 09:30:00', 399000, 'success');

-- Seed data for PAYMENT
INSERT INTO PAYMENT (order_id, payment_method, amount, transaction_id, status) VALUES
  (1, 'BCA Virtual Account', 299000, 'TRX-BCA-20250115-001', 'success'),
  (2, 'Mandiri Virtual Account', 499000, 'TRX-MDR-20250201-002', 'success'),
  (3, 'ShopeePay', 499000, 'TRX-SPY-20250120-003', 'success'),
  (4, 'DANA', 499000, 'TRX-DNA-20250205-004', 'success'),
  (5, 'OVO', 499000, 'TRX-OVO-20250210-005', 'success'),
  (6, 'GoPay', 399000, 'TRX-GPY-20250125-006', 'success'),
  (7, 'BRI Virtual Account', 399000, 'TRX-BRI-20250215-007', 'success');

-- Seed data for PROGRESS (simulating user learning progress)
INSERT INTO PROGRESS (user_id, materials_id, is_completed, completion_date) VALUES
  -- User 1 completed Module 1
  (1, 1, TRUE, '2025-01-16 11:00:00'),
  (1, 2, TRUE, '2025-01-17 14:30:00'),
  (1, 3, TRUE, '2025-01-18 10:15:00'),
  (1, 4, TRUE, '2025-01-19 16:45:00'),
  
  -- User 1 in progress Module 2
  (1, 5, TRUE, '2025-02-02 09:30:00'),
  (1, 6, TRUE, '2025-02-03 15:20:00'),
  (1, 7, FALSE, NULL),
  
  -- User 2 completed Module 2
  (2, 5, TRUE, '2025-01-21 10:00:00'),
  (2, 6, TRUE, '2025-01-22 11:30:00'),
  (2, 7, TRUE, '2025-01-23 14:00:00'),
  (2, 8, TRUE, '2025-01-24 16:30:00'),
  (2, 9, TRUE, '2025-01-25 09:00:00'),
  (2, 10, TRUE, '2025-01-26 13:45:00');

-- Seed data for CERTIFICATE (issued after completion)
INSERT INTO CERTIFICATE (user_id, module_id, issue_number, final_score) VALUES
  (1, 1, 'CERT-UIUX-20250119-001', 92.5),
  (2, 2, 'CERT-REACT-20250126-002', 88.0);

-- Seed data for PRETEST_RESULT
INSERT INTO PRETEST_RESULT (user_id, pretest_id, score, answers) VALUES
  (1, 1, 100, '{"q1": "Sketsa awal struktur tampilan antarmuka"}'),
  (1, 2, 100, '{"q1": "Untuk menyimpan dan memperbarui state komponen"}'),
  (2, 2, 100, '{"q1": "Untuk menyimpan dan memperbarui state komponen"}'),
  (3, 2, 0, '{"q1": "Untuk membuat CSS"}'),
  (4, 2, 100, '{"q1": "Untuk menyimpan dan memperbarui state komponen"}'),
  (5, 3, 100, '{"q1": "Click-Through Rate, rasio klik terhadap jumlah tayangan"}'),
  (1, 3, 100, '{"q1": "Click-Through Rate, rasio klik terhadap jumlah tayangan"}');

-- ============================================
-- SUMMARY STATISTICS
-- ============================================

-- Total records inserted:
-- CATEGORY: 8 records
-- TUTOR: 5 records
-- USER: 6 records (5 students + 1 admin)
-- MODULES: 5 records
-- PRETEST: 5 records
-- MATERIALS: 25 records
-- QUIZ: 11 records
-- ENROLLMENT: 7 records
-- REVIEW: 6 records
-- ORDER: 7 records
-- PAYMENT: 7 records
-- PROGRESS: 13 records
-- CERTIFICATE: 2 records
-- PRETEST_RESULT: 7 records