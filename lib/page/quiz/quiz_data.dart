class Question {
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

final Map<String, List<Question>> questionsByCategory = {
  // Bahasa Pemrograman
  'HTML': [
    Question(
      question: 'Apa singkatan dari HTML?',
      options: ['HyperText Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Hyper Trainer Marking Language'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tag HTML untuk membuat paragraf adalah?',
      options: ['<p>', '<para>', '<paragraph>', '<pg>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tag HTML yang digunakan untuk membuat judul tingkat 1 adalah?',
      options: ['<h1>', '<header>', '<heading1>', '<title>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Atribut HTML untuk menambahkan link disebut?',
      options: ['href', 'src', 'link', 'url'],
      correctIndex: 0,
    ),
    Question(
      question: 'Elemen HTML yang digunakan untuk menampilkan gambar adalah?',
      options: ['<img>', '<image>', '<pic>', '<src>'],
      correctIndex: 0,
    ),
    Question(
      question: 'HTML merupakan bahasa yang digunakan untuk?',
      options: ['Mendesain tampilan web', 'Menentukan struktur isi halaman web', 'Membuat program backend', 'Mendeklarasikan variabel'],
      correctIndex: 1,
    ),
    Question(
      question: 'Tag HTML untuk membuat daftar tidak berurutan adalah?',
      options: ['<ul>', '<ol>', '<li>', '<dl>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tag HTML untuk membuat tautan hyperlink adalah?',
      options: ['<a>', '<link>', '<href>', '<url>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Atribut untuk memberikan teks alternatif pada gambar adalah?',
      options: ['alt', 'title', 'text', 'desc'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tag HTML yang digunakan untuk memasukkan skrip adalah?',
      options: ['<script>', '<code>', '<js>', '<style>'],
      correctIndex: 0,
    ),
  ],

  'CSS': [
    Question(
      question: 'CSS merupakan singkatan dari?',
      options: ['Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style System', 'Colorful Style Sheets'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti CSS untuk mengubah warna teks adalah?',
      options: ['color', 'font-color', 'text-color', 'background-color'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti untuk mengatur jarak di dalam elemen adalah?',
      options: ['padding', 'margin', 'border', 'spacing'],
      correctIndex: 0,
    ),
    Question(
      question: 'Bagaimana menulis komentar di CSS?',
      options: ['/* komentar */', '// komentar', '# komentar', '<!-- komentar -->'],
      correctIndex: 0,
    ),
    Question(
      question: 'Selector CSS yang memilih semua elemen <p> adalah?',
      options: ['p', '.p', '#p', '*p'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti CSS untuk mengatur jenis huruf adalah?',
      options: ['font-family', 'font-style', 'text-font', 'font-weight'],
      correctIndex: 0,
    ),
    Question(
      question: 'Nilai properti display yang membuat elemen menjadi blok adalah?',
      options: ['block', 'inline', 'inline-block', 'none'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti untuk menambah bayangan pada teks adalah?',
      options: ['text-shadow', 'box-shadow', 'shadow', 'font-shadow'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti CSS untuk mengatur lebar garis tepi adalah?',
      options: ['border-width', 'border-style', 'border-color', 'border-size'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti CSS yang digunakan untuk mengatur jarak luar elemen adalah?',
      options: ['margin', 'padding', 'spacing', 'border'],
      correctIndex: 0,
    ),
  ],

  'JAVASCRIPT': [
    Question(
      question: 'JavaScript adalah bahasa yang digunakan untuk?',
      options: ['Membuat tampilan web dinamis', 'Mendesain layout web', 'Membuat server web', 'Mendeklarasikan database'],
      correctIndex: 0,
    ),
    Question(
      question: 'Cara mendeklarasikan variabel dalam JavaScript versi terbaru?',
      options: ['let', 'var', 'const', 'declare'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi untuk menampilkan pesan alert di JavaScript adalah?',
      options: ['alert()', 'prompt()', 'confirm()', 'console.log()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tipe data boolean di JavaScript hanya memiliki nilai?',
      options: ['true atau false', '1 atau 0', 'on atau off', 'yes atau no'],
      correctIndex: 0,
    ),
    Question(
      question: 'Bagaimana menulis komentar satu baris di JavaScript?',
      options: ['// komentar', '/* komentar */', '# komentar', '-- komentar'],
      correctIndex: 0,
    ),
    Question(
      question: 'Sintaks untuk membuat fungsi di JavaScript adalah?',
      options: ['function nama() {}', 'func nama() {}', 'def nama() {}', 'fun nama() {}'],
      correctIndex: 0,
    ),
    Question(
      question: 'Event yang dipicu ketika pengguna menekan tombol mouse?',
      options: ['onclick', 'onhover', 'onpress', 'onrelease'],
      correctIndex: 0,
    ),
    Question(
      question: 'Objek yang mewakili browser di JavaScript adalah?',
      options: ['window', 'document', 'navigator', 'screen'],
      correctIndex: 0,
    ),
    Question(
      question: 'Syntax untuk menampilkan output di konsol browser?',
      options: ['console.log()', 'print()', 'echo()', 'write()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Metode yang digunakan untuk menambahkan elemen ke array adalah?',
      options: ['push()', 'pop()', 'shift()', 'unshift()'],
      correctIndex: 0,
    ),
  ],

  'PHP': [
    Question(
      question: 'PHP adalah bahasa pemrograman untuk?',
      options: ['Pengembangan web server-side', 'Pengembangan aplikasi desktop', 'Pengembangan mobile', 'Desain grafis'],
      correctIndex: 0,
    ),
    Question(
      question: 'Penulisan tag pembuka PHP adalah?',
      options: ['<?php', '<?=php', '<php>', '</php>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Penulisan tag penutup PHP adalah?',
      options: ['</>', '<>', '>?', '?>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi untuk mencetak output di PHP?',
      options: ['echo', 'print', 'printf', 'semua benar'],
      correctIndex: 3,
    ),
    Question(
      question: 'Operator konkatenasi string di PHP adalah?',
      options: ['.', '+', '&', 'concat()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi untuk menghitung panjang string di PHP?',
      options: ['strlen()', 'count()', 'size()', 'length()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi untuk mengubah string menjadi huruf kecil adalah?',
      options: ['strtolower()', 'strtoupper()', 'lowercase()', 'uppercase()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Cara membuat array di PHP?',
      options: ['array()', 'list()', '{}', '[]'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi PHP untuk memulai sesi adalah?',
      options: ['session_start()', 'session_init()', 'start_session()', 'init_session()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi untuk mengecek apakah variabel sudah di-set atau belum di PHP?',
      options: ['isset()', 'empty()', 'defined()', 'exists()'],
      correctIndex: 0,
    ),
  ],

  'PYTHON': [
    Question(
      question: 'Python adalah bahasa pemrograman untuk?',
      options: ['General purpose', 'Hanya web development', 'Hanya mobile app', 'Hanya game development'],
      correctIndex: 0,
    ),
    Question(
      question: 'Cara mendeklarasikan fungsi di Python?',
      options: ['def nama_fungsi():', 'function nama_fungsi()', 'func nama_fungsi() {}', 'function nama_fungsi():'],
      correctIndex: 0,
    ),
    Question(
      question: 'Operator perbandingan sama dengan di Python adalah?',
      options: ['==', '=', '===', 'equals'],
      correctIndex: 0,
    ),
    Question(
      question: 'Untuk membuat komentar satu baris di Python digunakan?',
      options: ['#', '//', '/* */', '<!-- -->'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tipe data list di Python diisi dengan?',
      options: ['[]', '{}', '()', '<>'],
      correctIndex: 0,
    ),
    Question(
      question: 'Cara membuat perulangan for di Python?',
      options: ['for i in range(5):', 'for(i=0; i<5; i++)', 'foreach i in 5', 'repeat 5 times'],
      correctIndex: 0,
    ),
    Question(
      question: 'Perintah untuk mencetak output di Python adalah?',
      options: ['print()', 'echo()', 'console.log()', 'write()'],
      correctIndex: 0,
    ),
    Question(
      question: 'Modul standar untuk memanipulasi file di Python adalah?',
      options: ['os', 'sys', 'file', 'input'],
      correctIndex: 0,
    ),
    Question(
      question: 'Bahasa Python dikembangkan oleh?',
      options: ['Guido van Rossum', 'James Gosling', 'Bjarne Stroustrup', 'Dennis Ritchie'],
      correctIndex: 0,
    ),
    Question(
      question: 'Extensi file Python adalah?',
      options: ['.py', '.java', '.cpp', '.js'],
      correctIndex: 0,
    ),
  ],

   // Pertanyaan Laravel
  'LARAVEL': [
    Question(
      question: 'Laravel adalah framework untuk bahasa pemrograman?',
      options: ['PHP', 'JavaScript', 'Python', 'Ruby'],
      correctIndex: 0,
    ),
    Question(
      question: 'Perintah untuk membuat project Laravel baru menggunakan Composer adalah?',
      options: ['composer create-project laravel/laravel nama_project', 'npm init laravel', 'laravel new nama_project', 'php artisan new nama_project'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi dari artisan di Laravel adalah?',
      options: ['CLI tools untuk menjalankan perintah Laravel', 'Database management', 'Template engine', 'HTTP routing'],
      correctIndex: 0,
    ),
    Question(
      question: 'File konfigurasi database di Laravel terletak pada?',
      options: ['.env', 'config/app.php', 'routes/web.php', 'database/migrations'],
      correctIndex: 0,
    ),
    Question(
      question: 'Untuk menjalankan migration database di Laravel menggunakan perintah?',
      options: ['php artisan migrate', 'php artisan db:migrate', 'composer migrate', 'php migrate'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fitur Laravel yang digunakan untuk membuat API adalah?',
      options: ['Laravel Sanctum', 'Laravel Mix', 'Laravel Breeze', 'Laravel Nova'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi route di Laravel adalah?',
      options: ['Menentukan URL dan aksi yang dijalankan', 'Menghubungkan ke database', 'Membuat view', 'Membuat migration'],
      correctIndex: 0,
    ),
    Question(
      question: 'Untuk menjalankan server development di Laravel digunakan perintah?',
      options: ['php artisan serve', 'php artisan run', 'php serve', 'composer serve'],
      correctIndex: 0,
    ),
    Question(
      question: 'Template engine yang digunakan Laravel adalah?',
      options: ['Blade', 'Twig', 'Smarty', 'Handlebars'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fitur Eloquent di Laravel digunakan untuk?',
      options: ['ORM (Object Relational Mapping)', 'Routing', 'Authentication', 'Caching'],
      correctIndex: 0,
    ),
  ],

  // Pertanyaan React
  'REACT': [
    Question(
      question: 'React dikembangkan oleh?',
      options: ['Facebook', 'Google', 'Microsoft', 'Twitter'],
      correctIndex: 0,
    ),
    Question(
      question: 'React digunakan untuk membuat?',
      options: ['User Interface', 'Backend API', 'Database', 'Server'],
      correctIndex: 0,
    ),
    Question(
      question: 'React menggunakan konsep apa untuk membangun UI?',
      options: ['Component', 'Module', 'Class', 'Function'],
      correctIndex: 0,
    ),
    Question(
      question: 'JSX pada React adalah?',
      options: ['Sintaks mirip HTML di dalam JavaScript', 'Library untuk styling', 'Fungsi untuk state management', 'Tool untuk routing'],
      correctIndex: 0,
    ),
    Question(
      question: 'State di React digunakan untuk?',
      options: ['Menyimpan data dinamis dalam komponen', 'Menyimpan data statis', 'Membuat API request', 'Mendeklarasikan fungsi'],
      correctIndex: 0,
    ),
    Question(
      question: 'Hook React untuk menjalankan efek samping adalah?',
      options: ['useEffect', 'useState', 'useRef', 'useContext'],
      correctIndex: 0,
    ),
    Question(
      question: 'Bagaimana cara membuat komponen fungsi di React?',
      options: ['function NamaKomponen() { return <div></div>; }', 'class NamaKomponen {}', 'var NamaKomponen = () => {}', 'semua benar'],
      correctIndex: 3,
    ),
    Question(
      question: 'React menggunakan Virtual DOM untuk?',
      options: ['Meningkatkan performa rendering UI', 'Mengelola database', 'Routing halaman', 'Membuat API'],
      correctIndex: 0,
    ),
    Question(
      question: 'Untuk mengirim data dari komponen induk ke anak di React menggunakan?',
      options: ['Props', 'State', 'Context', 'Hooks'],
      correctIndex: 0,
    ),
    Question(
      question: 'Library populer yang sering dipakai untuk routing di React adalah?',
      options: ['React Router', 'React Navigation', 'React Link', 'React Route'],
      correctIndex: 0,
    ),
  ],

  // Pertanyaan Next.js
  'NEXT JS': [
    Question(
      question: 'Next.js adalah framework berbasis?',
      options: ['React', 'Vue', 'Angular', 'Svelte'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fitur utama Next.js untuk SEO adalah?',
      options: ['Server-Side Rendering (SSR)', 'Client-Side Rendering (CSR)', 'Static Site Generation (SSG)', 'Hydration'],
      correctIndex: 0,
    ),
    Question(
      question: 'File untuk membuat halaman di Next.js berada di folder?',
      options: ['pages', 'components', 'public', 'src'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi getStaticProps di Next.js digunakan untuk?',
      options: ['Mendapatkan data secara statis saat build time', 'Mendapatkan data secara dinamis saat runtime', 'Mengatur routing halaman', 'Mengatur state komponen'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi getServerSideProps digunakan untuk?',
      options: ['Mengambil data saat request server', 'Membuat komponen', 'Mengatur state', 'Routing halaman'],
      correctIndex: 0,
    ),
    Question(
      question: 'Next.js menggunakan bahasa pemrograman?',
      options: ['JavaScript dan TypeScript', 'PHP', 'Python', 'Ruby'],
      correctIndex: 0,
    ),
    Question(
      question: 'Folder public di Next.js berfungsi untuk?',
      options: ['Menyimpan aset statis seperti gambar', 'Menyimpan komponen', 'Menyimpan halaman', 'Menyimpan data server'],
      correctIndex: 0,
    ),
    Question(
      question: 'Next.js mendukung mode rendering?',
      options: ['Static Generation, Server-side Rendering, dan Client-side Rendering', 'Static Generation saja', 'Server-side Rendering saja', 'Client-side Rendering saja'],
      correctIndex: 0,
    ),
    Question(
      question: 'Perintah untuk menjalankan project Next.js secara lokal adalah?',
      options: ['npm run dev', 'npm start', 'npm build', 'npm test'],
      correctIndex: 0,
    ),
    Question(
      question: 'Next.js menyediakan fitur API routes untuk?',
      options: ['Membuat API backend di dalam project', 'Mengatur routing halaman', 'Mengelola state', 'Menyimpan aset statis'],
      correctIndex: 0,
    ),
  ],

  // Frameworks (contoh)
  'ALL FRAMEWORKS': [
    Question(
      question: 'Framework Next.js berbasis pada library?',
      options: ['React', 'Vue', 'Angular', 'Svelte'],
      correctIndex: 0,
    ),
    Question(
      question: 'Flutter menggunakan bahasa pemrograman?',
      options: ['Dart', 'Java', 'Kotlin', 'Swift'],
      correctIndex: 0,
    ),
    Question(
      question: 'Framework Laravel menggunakan bahasa?',
      options: ['PHP', 'JavaScript', 'Python', 'Ruby'],
      correctIndex: 0,
    ),
    Question(
      question: 'React adalah library untuk membuat?',
      options: ['UI', 'Backend', 'Database', 'Testing'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tailwind CSS adalah?',
      options: ['Utility-first CSS framework', 'JavaScript framework', 'Database system', 'API'],
      correctIndex: 0,
    ),
    Question(
      question: 'Next.js sering digunakan untuk?',
      options: ['Server-side rendering', 'Mobile apps', 'Database management', 'Testing'],
      correctIndex: 0,
    ),
    Question(
      question: 'Laravel terkenal sebagai?',
      options: ['PHP framework', 'JavaScript library', 'CSS framework', 'Database'],
      correctIndex: 0,
    ),
    Question(
      question: 'Flutter bisa digunakan untuk?',
      options: ['Mobile apps', 'Web apps', 'Desktop apps', 'Semua benar'],
      correctIndex: 3,
    ),
    Question(
      question: 'React mengembangkan UI berdasarkan?',
      options: ['Components', 'Controllers', 'Models', 'Services'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tailwind CSS memanfaatkan konsep?',
      options: ['Utility classes', 'Styled Components', 'Inline styles', 'Custom elements'],
      correctIndex: 0,
    ),
  ],

  'TAILWIND CSS': [
    Question(
      question: 'Tailwind CSS adalah jenis framework?',
      options: ['Utility-first CSS framework', 'JavaScript framework', 'Backend framework', 'Testing framework'],
      correctIndex: 0,
    ),
    Question(
      question: 'Mana class Tailwind untuk margin atas 4 unit?',
      options: ['mt-4', 'mb-4', 'ml-4', 'mr-4'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti Tailwind untuk warna latar belakang merah?',
      options: ['bg-red-500', 'text-red-500', 'border-red-500', 'hover-red-500'],
      correctIndex: 0,
    ),
    Question(
      question: 'Bagaimana menulis kelas untuk font tebal di Tailwind?',
      options: ['font-bold', 'bold-font', 'text-bold', 'font-heavy'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tailwind CSS dapat digunakan dengan?',
      options: ['HTML', 'React', 'Vue', 'Semua benar'],
      correctIndex: 3,
    ),
    Question(
      question: 'Selector untuk mengatur teks menjadi kapital di Tailwind?',
      options: ['uppercase', 'capitalize', 'lowercase', 'text-capital'],
      correctIndex: 0,
    ),
    Question(
      question: 'Class untuk mengatur padding horizontal 8 unit?',
      options: ['px-8', 'py-8', 'pl-8', 'pr-8'],
      correctIndex: 0,
    ),
    Question(
      question: 'Tailwind menggunakan sistem warna berbasis?',
      options: ['Skala 100-900', 'RGB', 'Hexadecimal', 'CMYK'],
      correctIndex: 0,
    ),
    Question(
      question: 'Class Tailwind untuk membuat elemen menjadi flexbox?',
      options: ['flex', 'block', 'inline-flex', 'grid'],
      correctIndex: 0,
    ),
    Question(
      question: 'Kelas Tailwind untuk menyembunyikan elemen?',
      options: ['hidden', 'invisible', 'none', 'display-none'],
      correctIndex: 0,
    ),
  ],

  'FLUTTER': [
    Question(
      question: 'Bahasa pemrograman utama Flutter adalah?',
      options: ['Dart', 'Java', 'Kotlin', 'Swift'],
      correctIndex: 0,
    ),
    Question(
      question: 'Widget dasar untuk membuat tampilan adalah?',
      options: ['Container', 'Row', 'Column', 'Scaffold'],
      correctIndex: 3,
    ),
    Question(
      question: 'Fungsi setState() digunakan untuk?',
      options: ['Memperbarui UI', 'Menghapus widget', 'Menambahkan widget', 'Membuat halaman baru'],
      correctIndex: 0,
    ),
    Question(
      question: 'Widget untuk membuat daftar scrollable adalah?',
      options: ['ListView', 'GridView', 'Column', 'Row'],
      correctIndex: 0,
    ),
    Question(
      question: 'Cara mendefinisikan widget Stateless di Flutter adalah?',
      options: ['class MyWidget extends StatelessWidget', 'class MyWidget extends StatefulWidget', 'widget StatelessWidget', 'widget StatefulWidget'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi Navigator digunakan untuk?',
      options: ['Navigasi antar halaman', 'Menampilkan dialog', 'Membuat widget', 'Mengakses database'],
      correctIndex: 0,
    ),
    Question(
      question: 'Properti untuk mengatur warna latar di Container adalah?',
      options: ['color', 'backgroundColor', 'bgColor', 'bg'],
      correctIndex: 0,
    ),
    Question(
      question: 'Widget yang mengatur tata letak vertikal disebut?',
      options: ['Column', 'Row', 'Stack', 'Flex'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi build() menghasilkan?',
      options: ['Widget', 'String', 'Int', 'Boolean'],
      correctIndex: 0,
    ),
    Question(
      question: 'Fungsi utama untuk menjalankan aplikasi Flutter adalah?',
      options: ['runApp()', 'startApp()', 'initApp()', 'launchApp()'],
      correctIndex: 0,
    ),

    
  ],

 
};
  