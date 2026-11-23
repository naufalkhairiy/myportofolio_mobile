# My Portfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter yang dibuat untuk mata kuliah Pemrograman Berbasis Platform di Universitas Indonesia.

## Author

- **Name:** Naufal Khairiy Zulkarnain Sormin
- **NPM:** 2506621850
- **Class:** PBP D


## Project Description

Project ini merupakan aplikasi portofolio pribadi berbasis Flutter yang dikembangkan untuk mata kuliah Pemrograman Berbasis Platform di Universitas Indonesia. Aplikasi ini merupakan versi mobile dari project website portofolio sebelumnya yang dibuat menggunakan Django.

Pada Tutorial 8, aplikasi dibangun menggunakan Flutter dan Dart dengan fokus pada pembuatan halaman utama, penggunaan StatelessWidget, serta pemisahan komponen antarmuka agar dapat digunakan kembali.

Pada Tugas 7, aplikasi dikembangkan dengan menampilkan identitas pemilik portofolio, tiga tombol aksi dengan warna berbeda, feedback menggunakan SnackBar, serta fitur tambahan berupa dialog informasi aplikasi.

Pada Tutorial 09, aplikasi mulai menggunakan navigasi antarhalaman melalui Navigator, Drawer, serta formulir Tambah Proyek yang menerapkan StatefulWidget, Form, validasi input, dan dialog.

Pada Tugas 8, aplikasi dikembangkan lebih lanjut dengan menambahkan halaman Tambah Edukasi. Formulir ini menggunakan atribut yang disesuaikan dengan model Education pada project Django sebelumnya. Pengguna dapat memasukkan informasi pendidikan, melakukan validasi, dan melihat ringkasan data melalui AlertDialog.

Sebagai fitur tambahan, terdapat Switch untuk menandai apakah pendidikan masih berlangsung. Fitur ini menentukan apakah input tahun selesai perlu diisi serta memastikan tahun selesai tidak lebih awal daripada tahun mulai.

Aplikasi saat ini masih berfokus pada implementasi antarmuka Flutter dan belum terhubung langsung dengan backend Django. Data formulir ditampilkan melalui dialog sebagai simulasi penyimpanan.

Repository website Django dapat diakses melalui:
https://github.com/naufalkhairiy/myportofolio

## Main Features

- Menampilkan identitas pemilik portofolio berupa NPM, nama lengkap, dan kelas.
- Menggunakan reusable InfoCard untuk menampilkan informasi pribadi.
- Menampilkan empat kartu aksi: Lihat Proyek, Tambah Proyek, Tambah Edukasi, dan Logout.
- Menggunakan ItemCard sebagai reusable widget untuk kartu aksi.
- Menggunakan model ItemHomepage untuk menyimpan nama, ikon, dan warna tombol.
- Menggunakan warna berbeda pada setiap kartu aksi.
- Menampilkan SnackBar sebagai feedback pada tombol yang masih berupa simulasi.
- Menggunakan GridView untuk menyusun kartu aksi.
- Menggunakan Material Design 3 dengan tema utama indigo.
- Menggunakan StatelessWidget untuk halaman utama.
- Menggunakan StatefulWidget untuk halaman formulir.
- Menggunakan Navigator.push() dan Navigator.pushReplacement() untuk perpindahan halaman.
- Menyediakan Drawer yang dapat digunakan pada halaman utama maupun formulir.
- Menyediakan formulir Tambah Proyek dan Tambah Edukasi.
- Menggunakan GlobalKey<FormState> dan validator untuk pemeriksaan input.
- Menolak nama institusi kosong atau hanya berisi spasi.
- Memvalidasi format tahun mulai dan tahun selesai.
- Memastikan tahun selesai tidak lebih awal daripada tahun mulai.
- Menggunakan SwitchListTile untuk menandai pendidikan yang masih berlangsung.
- Menampilkan ringkasan seluruh input pendidikan menggunakan AlertDialog.
- Menggunakan SingleChildScrollView agar formulir dapat digulir pada layar kecil.
- Mempertahankan fitur dialog informasi aplikasi pada AppBar.
- Menggunakan flutter analyze dan widget testing untuk memeriksa kualitas implementasi.


## Technologies Used

- Dart
- Flutter SDK
- Flutter Material Design 3
- Visual Studio Code
- Google Chrome untuk pengujian Flutter Web
- Git dan GitHub


## Project Structure

Struktur source code utama:

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── menu.dart
│   │   ├── project_form.dart
│   │   └── education_form.dart
│   └── widgets/
│       ├── left_drawer.dart
│       └── project_card.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

`main.dart` merupakan entry point aplikasi yang mengatur MaterialApp dan tema utama.

`menu.dart` berisi MyHomePage, model ItemHomepage, dan komponen InfoCard.

`project_form.dart` menyediakan formulir Tambah Proyek dari Tutorial 09.

`education_form.dart` menyediakan formulir Tambah Edukasi dengan validasi, Switch, dan dialog ringkasan.

`left_drawer.dart` berisi komponen Drawer yang digunakan kembali pada beberapa halaman.

`project_card.dart` berisi ItemCard untuk menampilkan kartu aksi dan menangani navigasi dari halaman utama.

Direktori `test/` digunakan untuk pengujian widget, navigasi, dan validasi formulir.


## How to Run Locally

1. Pastikan Flutter SDK sudah terpasang. Periksa menggunakan:

```bash
flutter --version
flutter doctor
```

2. Clone repository:

```bash
git clone https://github.com/naufalkhairiy/myportofolio_mobile.git
```

3. Masuk ke direktori project:

```bash
cd myportofolio_mobile
```

4. Install dependency Flutter:

```bash
flutter pub get
```

5. Jalankan aplikasi melalui Google Chrome:

```bash
flutter run -d chrome
```

6. Periksa kualitas kode:

```bash
flutter analyze
```

7. Jalankan automated widget testing setelah test dikonfigurasi:

```bash
flutter test
```

Aplikasi dapat dijalankan melalui browser Chrome tanpa memerlukan Android Emulator. Untuk membangun aplikasi Android secara native, diperlukan Android SDK dan konfigurasi development Android yang sesuai.

## Weekly Progress

### Tutorial 8 - Basic Flutter

- Melakukan instalasi dan konfigurasi Flutter SDK serta Dart.
- Memeriksa konfigurasi development menggunakan `flutter doctor`.
- Membuat project baru menggunakan `flutter create myportofolio_mobile`.
- Menjalankan aplikasi Flutter menggunakan Google Chrome.
- Memisahkan halaman utama ke dalam file `menu.dart`.
- Menggunakan `StatelessWidget` untuk MyHomePage.
- Membuat reusable widget InfoCard dan ItemCard.
- Menggunakan Scaffold, AppBar, Row, Column, Padding, dan GridView.
- Mengimplementasikan SnackBar sebagai feedback ketika tombol ditekan.
- Menggunakan `flutter analyze` untuk mendeteksi masalah kode.
- Menyimpan project pada repository GitHub terpisah dari project Django.

### Tugas 7 - Personal Portfolio Flutter

- Menggunakan data pribadi sebagai informasi pemilik portofolio.
- Menampilkan NPM, nama lengkap, dan kelas melalui tiga InfoCard.
- Mempertahankan tiga tombol aksi portofolio.
- Menambahkan atribut warna pada model ItemHomepage.
- Mengubah warna tombol menjadi biru, hijau, dan merah.
- Mempertahankan SnackBar yang menampilkan nama tombol yang ditekan.
- Menambahkan fitur ekstra berupa tombol informasi pada AppBar.
- Menggunakan AlertDialog untuk menampilkan informasi aplikasi dan tombol untuk menutup dialog.
- Menggunakan branch `tugas-7-flutter` untuk memisahkan pengembangan tugas dari branch utama.
- Mengelompokkan perubahan kode, dokumentasi, dan testing melalui commit Git yang terpisah.


### Tutorial 09 - Flutter Navigation and Forms

- Melakukan refactoring struktur project dengan memisahkan halaman ke direktori screens dan reusable widget ke direktori widgets.
- Membuat halaman formulir Tambah Proyek menggunakan StatefulWidget.
- Menggunakan Form dan GlobalKey<FormState> untuk mengelola validasi input.
- Menggunakan TextFormField dan DropdownButtonFormField untuk menerima data proyek.
- Menambahkan Drawer sebagai navigasi antarhalaman.
- Menggunakan Navigator untuk membuka halaman dan mengatur perpindahan antarhalaman.
- Menggunakan AlertDialog sebagai feedback setelah formulir lolos validasi.
- Menjalankan flutter analyze untuk memeriksa implementasi.
- Menyimpan hasil Tutorial 09 melalui Git dan GitHub.

### Tugas 8 - Education Form

- Membuat education_form.dart sebagai halaman formulir baru.
- Menyesuaikan input dengan model Education pada project Django sebelumnya.
- Menambahkan input institusi, program studi, tahun mulai, dan tahun selesai.
- Menggunakan validasi untuk menolak input wajib yang kosong.
- Memvalidasi format tahun dan memastikan urutan tahun masuk akal.
- Menambahkan fitur ekstra berupa Switch untuk pendidikan yang masih berlangsung.
- Menambahkan kartu Tambah Edukasi pada halaman utama.
- Menambahkan navigasi Add Education pada Drawer.
- Menggunakan AlertDialog untuk menampilkan ringkasan seluruh input.
- Memperbaiki responsivitas halaman dan tampilan Drawer.
- Memperbarui widget testing untuk menyesuaikan fitur baru.
- Melakukan debugging berdasarkan hasil flutter analyze dan flutter test.
- Menggunakan branch tugas-8-flutter dan commit terpisah untuk setiap tahap pengembangan.


## Tugas 7

### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

Widget tree adalah struktur hierarkis yang menggambarkan susunan widget dalam aplikasi Flutter. Flutter menggunakan widget untuk membangun antarmuka, mulai dari struktur halaman sampai elemen seperti teks, ikon, tombol, dan kartu.

Setiap widget dapat memiliki widget lain sebagai anak (child). Widget yang berada di atas disebut parent, sedangkan widget di bawahnya disebut child. Parent menentukan bagaimana child disusun atau ditampilkan berdasarkan karakteristik widget tersebut.

Sebagai contoh, pada project saya terdapat struktur:

```text
MaterialApp
└── MyHomePage
    └── Scaffold
        ├── AppBar
        └── Padding
            └── Column
                ├── Row
                │   ├── InfoCard
                │   ├── InfoCard
                │   └── InfoCard
                └── Center
                    └── Column
                        ├── Text
                        └── GridView
                            ├── ItemCard
                            ├── ItemCard
                            └── ItemCard
```

Pada contoh tersebut, MaterialApp menjadi root widget aplikasi. MyHomePage menghasilkan Scaffold yang menyediakan struktur halaman. Scaffold mempunyai AppBar dan body yang berisi widget lainnya.

Row digunakan untuk menempatkan tiga InfoCard secara horizontal, sedangkan Column digunakan untuk menyusun elemen secara vertikal. GridView digunakan untuk menampilkan ItemCard dalam bentuk kisi.

Hubungan parent-child penting karena menentukan struktur visual, pengaturan posisi, serta bagaimana konfigurasi dan batasan layout diteruskan ke widget di bawahnya. Dengan struktur widget tree, tampilan dapat dipecah menjadi komponen yang lebih kecil dan mudah digunakan kembali.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

Pada project MyPortfolio Mobile, saya menggunakan widget bawaan Flutter dan beberapa widget yang dibuat sendiri.

**Widget utama aplikasi:**

1. **MaterialApp:** Widget utama yang mengatur konfigurasi aplikasi, tema, dan halaman awal.
2. **Scaffold:** Menyediakan struktur dasar halaman seperti AppBar dan body.
3. **AppBar:** Menampilkan judul aplikasi serta tombol informasi di bagian atas.
4. **StatelessWidget:** Digunakan sebagai dasar pembuatan widget yang tidak menyimpan state internal yang berubah.

**Widget layout dan tampilan:**

5. **Padding:** Memberikan jarak di sekitar widget agar tampilan tidak terlalu rapat.
6. **Column:** Menyusun beberapa widget secara vertikal.
7. **Row:** Menyusun beberapa widget secara horizontal.
8. **Center:** Menempatkan child di tengah area yang tersedia.
9. **Container:** Mengatur ukuran, padding, dan ruang untuk elemen antarmuka.
10. **SizedBox:** Memberikan jarak kosong antar-widget.
11. **GridView.count:** Menampilkan tombol menu dalam bentuk grid dengan tiga kolom.
12. **Card:** Membuat kartu informasi dengan tampilan Material dan efek elevasi.
13. **Text:** Menampilkan informasi berupa teks.
14. **Icon:** Menampilkan ikon pada tombol aksi dan tombol informasi.
15. **Material:** Menyediakan permukaan Material dengan warna dan bentuk tertentu.
16. **InkWell:** Memberikan kemampuan interaksi sentuh dan efek ripple ketika kartu ditekan.

**Widget interaktif:**

17. **SnackBar:** Menampilkan pesan singkat ketika pengguna menekan tombol aksi.
18. **IconButton:** Menampilkan tombol informasi berbentuk ikon di AppBar.
19. **AlertDialog:** Menampilkan dialog yang berisi informasi mengenai aplikasi.
20. **TextButton:** Membuat tombol Tutup di dalam dialog.

**Widget buatan sendiri:**

21. **MyApp:** Widget yang mengatur MaterialApp, tema, dan halaman utama.
22. **MyHomePage:** Widget yang membangun halaman utama portofolio.
23. **InfoCard:** Widget reusable yang menampilkan pasangan judul dan isi, misalnya NPM dan nilainya.
24. **ItemCard:** Widget reusable yang menampilkan tombol aksi berisi ikon, nama, warna, dan interaksi SnackBar.

Selain widget tersebut, terdapat API pendukung seperti `BuildContext`, `MediaQuery`, `Theme.of()`, `ScaffoldMessenger`, `Navigator`, `TextStyle`, dan `ColorScheme`. Komponen-komponen ini membantu pengaturan tampilan, interaksi, dan navigasi, tetapi tidak semuanya merupakan widget yang ditambahkan secara langsung ke widget tree.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

MaterialApp merupakan widget yang menyediakan konfigurasi dasar untuk aplikasi Flutter yang menggunakan Material Design.

MaterialApp dapat mengatur tema, judul aplikasi, konfigurasi navigasi, serta berbagai fasilitas Material yang digunakan widget turunannya.

Pada project saya, MaterialApp didefinisikan di dalam class MyApp:

```dart
return MaterialApp(
  title: 'MyPortfolio',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      secondary: Colors.amber[700],
    ),
    useMaterial3: true,
  ),
  home: const MyHomePage(),
);
```

Properti `title` menentukan judul aplikasi. `theme` digunakan untuk mengatur tema visual, termasuk skema warna. Properti `home` menentukan halaman awal yang ditampilkan ketika aplikasi dibuka.

MaterialApp umumnya digunakan sebagai root widget pada aplikasi berbasis Material Design karena menyediakan konfigurasi yang dapat digunakan oleh widget-widget turunannya. Misalnya, widget di dalam MyHomePage dapat membaca warna tema melalui `Theme.of(context)`.

MaterialApp juga menyediakan infrastruktur navigasi yang dapat digunakan untuk mengelola perpindahan halaman maupun dialog.

Tanpa MaterialApp, pengembang harus menyediakan sendiri berbagai fasilitas yang biasanya diperlukan untuk aplikasi Material. Oleh karena itu, MaterialApp mempermudah pengelolaan konfigurasi aplikasi secara terpusat.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

StatelessWidget dan StatefulWidget merupakan dua jenis widget yang digunakan untuk membangun tampilan Flutter.

**StatelessWidget** merupakan widget yang tidak mempunyai objek State internal yang berubah selama siklus hidupnya. Tampilan widget tetap dapat dibangun ulang ketika konfigurasi dari parent atau dependensi yang digunakannya berubah, tetapi widget tersebut tidak mengelola perubahan state lokal melalui `setState()`.

Contohnya adalah MyHomePage pada project saya. Halaman ini menampilkan informasi NPM, nama, kelas, serta tombol aksi yang datanya sudah ditentukan. Tidak diperlukan variabel penghitung atau state lokal yang terus berubah.

**StatefulWidget** merupakan widget yang mempunyai objek State terpisah untuk menyimpan dan mengelola data yang dapat berubah selama aplikasi berjalan. Ketika state berubah melalui `setState()`, Flutter akan menjadwalkan proses build ulang untuk memperbarui tampilannya.

StatefulWidget cocok untuk fitur seperti penghitung angka, checkbox yang berubah, form interaktif, tab dengan state lokal, atau elemen lain yang perlu mempertahankan perubahan selama pengguna berinteraksi.

Perbedaan utamanya adalah cara widget mengelola state internal.

Saya memilih StatelessWidget untuk MyHomePage, InfoCard, dan ItemCard karena data yang ditampilkan tidak membutuhkan pengelolaan state lokal yang berubah.

Meskipun ItemCard dapat ditekan dan menampilkan SnackBar, hal tersebut tidak otomatis mengharuskan widget menjadi StatefulWidget. Aksi tombol dapat dilakukan melalui callback tanpa menyimpan perubahan state di dalam ItemCard.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

BuildContext merupakan objek yang merepresentasikan posisi suatu widget di dalam struktur elemen Flutter. BuildContext digunakan untuk mengakses informasi atau fasilitas yang tersedia berdasarkan posisi widget tersebut dalam widget tree.

BuildContext penting karena banyak fitur Flutter membutuhkan konteks lokasi widget untuk mengambil konfigurasi dari widget ancestor, seperti tema, ukuran layar, dan fasilitas navigasi.

Pada project saya, setiap widget mempunyai method:

```dart
@override
Widget build(BuildContext context) {
  // Membangun tampilan widget.
}
```

Parameter `context` memberikan akses terhadap informasi yang diperlukan ketika membangun tampilan.

Sebagai contoh, pada MyHomePage digunakan:

```dart
Theme.of(context).colorScheme.primary
```

Kode tersebut mengambil warna utama dari tema aplikasi yang tersedia melalui ancestor widget.

Pada InfoCard terdapat:

```dart
MediaQuery.of(context).size.width
```

Kode tersebut mengambil informasi lebar layar untuk membantu menentukan ukuran kartu.

Pada ItemCard, context juga digunakan untuk menampilkan SnackBar:

```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Tombol ditekan!'),
  ),
);
```

Sedangkan pada fitur tambahan dialog, `showDialog()` menggunakan context untuk menemukan fasilitas navigasi dan menampilkan dialog pada lokasi yang sesuai.

BuildContext perlu digunakan dengan tepat karena hasil pencarian ancestor bergantung pada posisi context tersebut di dalam widget tree.

### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Hot reload adalah fitur Flutter yang memungkinkan perubahan source code diterapkan ke aplikasi yang sedang berjalan tanpa memulai seluruh aplikasi dari awal.

Ketika hot reload dijalankan, Flutter memperbarui kode dan membangun ulang bagian tampilan yang diperlukan. State aplikasi yang sedang berjalan umumnya tetap dipertahankan.

Pada terminal Flutter, hot reload dapat dilakukan dengan menekan tombol `r`.

Fitur ini berguna ketika mengubah teks, warna, padding, atau susunan widget, karena hasil perubahan dapat langsung diperiksa tanpa menunggu aplikasi dijalankan ulang sepenuhnya.

**Hot restart** mempunyai perilaku berbeda. Hot restart memulai ulang eksekusi kode Dart aplikasi dari awal sehingga state aplikasi sebelumnya akan hilang.

Pada terminal Flutter, hot restart dapat dilakukan dengan menekan tombol `R`.

Contohnya, jika suatu perubahan terjadi pada proses inisialisasi atau kode yang hanya dijalankan ketika aplikasi mulai, hot reload mungkin tidak cukup karena proses tersebut tidak otomatis dijalankan kembali. Dalam kondisi seperti itu, hot restart lebih sesuai.

**Full restart** berarti menghentikan proses aplikasi dan menjalankannya kembali. Full restart diperlukan untuk perubahan tertentu yang tidak dapat diterapkan melalui hot reload atau hot restart, misalnya perubahan konfigurasi native Android atau iOS, integrasi plugin native, maupun perubahan yang membutuhkan proses build ulang.

Secara ringkas:

- **Hot reload:** Memperbarui kode dan tampilan sambil mempertahankan state aplikasi.
- **Hot restart:** Memulai ulang aplikasi Dart dan menghapus state yang sedang berjalan.
- **Full restart:** Menghentikan aplikasi dan menjalankan kembali prosesnya, termasuk tahapan build yang diperlukan.

Dalam pengembangan MyPortfolio Mobile, hot reload berguna untuk memeriksa perubahan tampilan tanpa perlu menjalankan ulang aplikasi setiap kali melakukan modifikasi kecil.

## AI Usage Disclosure - Week 7

Pada Tutorial 8 dan Tugas 7, saya menggunakan ChatGPT dari OpenAI sebagai alat bantu untuk memahami materi Flutter, membaca requirement resmi, merencanakan implementasi, meninjau source code, membantu debugging, menggunakan Git, serta menyusun dokumentasi dan jawaban reflektif.

Penggunaan AI tidak hanya terbatas pada penjelasan konsep. AI juga menyediakan contoh kode dan file awal Flutter yang saya gunakan sebagai dasar pengerjaan Tutorial 8. Kode tersebut kemudian dimodifikasi dan diperiksa melalui project lokal.

### Strategi Penggunaan AI

Saya menggunakan pendekatan source-first dengan memberikan dokumen resmi Tutorial 8 dan Tugas 7 kepada ChatGPT sebelum merencanakan implementasi.

Saya juga memberikan link repository Django sebelumnya agar struktur dokumentasi dapat dijadikan referensi, serta repository Flutter untuk membandingkan implementasi dengan kebutuhan tugas.

Agar pengerjaan lebih terarah, saya meminta AI membagi tugas menjadi beberapa tahap:

1. Mengubah warna tiga tombol aksi menggunakan model ItemHomepage.
2. Menambahkan fitur interaktif sederhana melalui AlertDialog.
3. Menyusun README dan menjawab enam pertanyaan reflektif.
4. Melakukan pemeriksaan kualitas kode dan testing.
5. Menyimpan perubahan menggunakan Git dan mengumpulkan tautan commit.

Saya membatasi ruang lingkup implementasi agar tetap relevan dengan materi Basic Flutter. Saya tidak menambahkan integrasi API Django, database, atau fitur autentikasi sungguhan karena belum termasuk kebutuhan tugas ini.

### Bagian yang Dibantu AI

AI digunakan untuk membantu:

- Memahami hubungan Flutter SDK dan Dart SDK.
- Memeriksa output `flutter doctor`.
- Menjelaskan perbedaan kebutuhan pengembangan Flutter Web dan Android.
- Membuat struktur awal project Flutter.
- Menyediakan contoh kode `main.dart` dan `menu.dart` berdasarkan Tutorial 8.
- Menjelaskan StatelessWidget, widget tree, dan reusable widget.
- Mengubah struktur model ItemHomepage agar mendukung warna tombol yang berbeda.
- Menambahkan fitur AlertDialog sebagai interaktivitas tambahan.
- Menjelaskan penggunaan BuildContext, SnackBar, dan Navigator.
- Menentukan pembagian tugas menjadi beberapa tahap.
- Memberikan panduan penggunaan Git dan GitHub CLI.
- Membantu menyusun README dan jawaban pertanyaan reflektif.
- Menyarankan pemeriksaan menggunakan `flutter analyze` dan automated widget testing.

### Keterbatasan AI dan Pemeriksaan Manual

Selama pengerjaan, saya menemukan bahwa saran AI tidak selalu langsung sesuai dengan kondisi project.

Pada Tutorial 8, kode awal yang disediakan AI menghasilkan peringatan `prefer_const_constructors_in_immutables` ketika diperiksa menggunakan `flutter analyze`. Masalah tersebut menunjukkan bahwa kode yang dapat dijalankan belum tentu sepenuhnya mengikuti aturan analisis statis Dart.

Perbaikannya adalah menggunakan konstruktor `const` pada MyHomePage serta menyesuaikan pemanggilannya di main.dart.

Selain itu, pada proses pengumpulan Tutorial 8, AI sempat memberikan instruksi Git dengan asumsi bahwa folder project telah diinisialisasi sebagai repository. Ketika dijalankan, Git mengembalikan pesan `fatal: not a git repository`. Masalah tersebut diselesaikan dengan menjalankan `git init` sebelum melakukan commit dan push.

Pengalaman tersebut menunjukkan bahwa AI dapat memberikan panduan yang berguna, tetapi tetap dapat membuat asumsi yang tidak sesuai dengan kondisi environment.

Untuk mengurangi risiko tersebut, saya menggunakan source code aktual, output terminal, dan instruksi resmi PBP sebagai acuan dalam memeriksa saran AI.

Saya juga memisahkan perubahan dalam branch dan commit yang berbeda agar implementasi fitur dapat ditelusuri dan diperiksa kembali.

### AI Prompting Log - Week 7

Berikut beberapa contoh permintaan yang digunakan selama pengerjaan Tutorial 8 dan Tugas 7:

- "Baca Tutorial 8 Basic Flutter dan bantu saya mengerjakannya dari nol."
- "Apakah saya perlu menginstal Dart secara terpisah jika Flutter SDK sudah terpasang?"
- "Periksa output flutter doctor saya dan tentukan masalah mana yang perlu diselesaikan."
- "Bagaimana cara mengubah NPM, nama, dan kelas pada menu.dart?"
- "Mengapa flutter analyze menampilkan peringatan terkait konstruktor const?"
- "Bagaimana cara membuat repository GitHub melalui CMD tanpa membuka halaman pembuatan repository?"
- "Baca requirement Tugas 7 dan buat workflow dengan perubahan minimal untuk mengejar nilai 4."
- "Tambahkan warna berbeda untuk setiap ItemCard menggunakan model ItemHomepage."
- "Tambahkan fitur ekstra sederhana yang relevan tanpa perlu backend."
- "Gunakan format README repository Django sebelumnya sebagai referensi dokumentasi Flutter."
- "Bantu menyusun jawaban enam pertanyaan reflektif berdasarkan implementasi Flutter dan materi tugas."
- "Pisahkan perubahan menjadi commit yang deskriptif dan pertahankan Git history yang rapi."

Prompting dilakukan secara bertahap dengan memberikan hasil terminal, screenshot, dan kondisi project pada setiap tahap ketika diperlukan.

### Evaluasi Penggunaan AI

AI membantu mempercepat proses pembelajaran serta memberikan arahan yang lebih terstruktur, terutama ketika mempelajari Flutter dan Dart yang masih baru bagi saya.

Namun, hasil AI tetap perlu ditinjau karena solusi yang terlihat benar secara sintaksis belum tentu sesuai dengan struktur project, environment, atau ketentuan penilaian.

Oleh karena itu, penggunaan AI dipadukan dengan pemeriksaan manual terhadap source code, pengujian aplikasi di browser, analisis statis, serta pemeriksaan riwayat Git.


## Pertanyaan Reflektif - Tugas 8

### Tugas 8

#### 1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.

Navigator merupakan mekanisme Flutter untuk mengelola perpindahan halaman menggunakan navigation stack.

Navigator.push() digunakan untuk membuka halaman baru dengan menambahkannya ke navigation stack. Halaman sebelumnya tetap tersimpan sehingga pengguna dapat kembali menggunakan tombol Back.

Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang aktif dengan halaman baru. Berbeda dengan push(), halaman sebelumnya tidak dipertahankan sebagai route aktif dalam posisi tersebut.

Navigator.pop() digunakan untuk menutup route yang sedang aktif dan kembali ke route sebelumnya. Metode ini juga dapat digunakan untuk menutup dialog atau Drawer sesuai dengan context yang digunakan.

Pada project saya, kartu Tambah Edukasi menggunakan Navigator.push() untuk membuka EducationFormPage. Dengan demikian, pengguna dapat kembali ke halaman utama menggunakan tombol Back.

Sementara itu, navigasi melalui Drawer menggunakan pushReplacement() untuk mengganti halaman yang aktif. Opsi Home mengarahkan pengguna ke MyHomePage. Drawer juga dapat ditutup terlebih dahulu menggunakan pop() sebelum melakukan perpindahan halaman.

Pemilihan metode tersebut membuat navigasi dari kartu dan Drawer tetap sesuai dengan kebutuhan masing-masing.

#### 2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Scaffold merupakan widget yang menyediakan struktur dasar halaman Flutter, termasuk AppBar, Drawer, dan body.

AppBar digunakan untuk menampilkan judul halaman serta tombol navigasi atau aksi tambahan. Drawer menyediakan menu navigasi yang dapat digunakan untuk berpindah ke halaman lain tanpa harus kembali ke halaman utama terlebih dahulu.

Pada project saya, MyHomePage dan EducationFormPage sama-sama menggunakan Scaffold dan AppBar. Kedua halaman juga menggunakan komponen LeftDrawer yang sama sehingga pengguna mendapatkan pilihan navigasi yang konsisten.

Konsistensi tampilan juga diterapkan melalui penggunaan warna tema. Aplikasi menggunakan warna utama indigo yang dikonfigurasi melalui ThemeData pada main.dart.

Warna tersebut digunakan pada AppBar halaman utama dan formulir melalui Theme.of(context).colorScheme.primary. Drawer juga menggunakan warna indigo pada bagian header.

Dengan penggunaan komponen dan tema yang konsisten, setiap halaman mempunyai struktur dan identitas visual yang seragam meskipun menampilkan konten berbeda.

#### 3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

Formulir Tambah Edukasi disusun menggunakan Column karena input pendidikan lebih mudah dibaca dan diisi secara vertikal dari atas ke bawah.

Setiap input ditempatkan secara berurutan, dimulai dari nama institusi, program studi, tahun mulai, pilihan pendidikan yang masih berlangsung, hingga tahun selesai dan tombol Simpan.

Widget Padding digunakan untuk memberikan jarak antara konten dengan tepi layar, sedangkan SizedBox digunakan untuk memberikan ruang antarinput agar formulir tidak terlalu rapat.

Selain itu, saya menggunakan SingleChildScrollView agar seluruh input tetap dapat diakses ketika tinggi layar terbatas atau papan ketik muncul.

Penggunaan SafeArea membantu menjaga konten agar tidak bertabrakan dengan area sistem perangkat.

Tata letak tersebut dipilih karena lebih sederhana, mudah digunakan, dan sesuai dengan kebutuhan formulir yang mempunyai beberapa input.

Tanpa widget penggulir, bagian bawah formulir berpotensi tidak dapat dijangkau ketika ruang layar tidak mencukupi.

#### 4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

GlobalKey<FormState> digunakan untuk mengakses dan mengelola state dari widget Form.

Setiap TextFormField dapat memiliki validator yang bertugas memeriksa apakah data yang dimasukkan memenuhi aturan tertentu. Validator mengembalikan pesan kesalahan apabila input tidak valid dan null apabila input diterima.

Ketika tombol Simpan ditekan, aplikasi memanggil _formkey.currentState!.validate() untuk menjalankan seluruh validator pada formulir.

Jika ada input yang tidak valid, proses penyimpanan dihentikan dan pesan kesalahan ditampilkan pada kolom terkait. Jika seluruh input valid, aplikasi menampilkan AlertDialog berisi ringkasan data pendidikan.

Contohnya, input nama institusi yang hanya berisi spasi akan ditolak karena validator menggunakan trim().isEmpty. Selain itu, tahun selesai 2024 juga akan ditolak apabila tahun mulai adalah 2025.

Penggunaan keyboardType: TextInputType.number membantu menampilkan papan ketik angka, sedangkan FilteringTextInputFormatter.digitsOnly membatasi karakter yang dapat dimasukkan.

Namun, pemilihan jenis papan ketik dan input formatter saja belum cukup untuk memastikan kebenaran data. Input angka seperti 123 tetap bukan tahun empat digit yang valid, dan tahun selesai yang lebih awal daripada tahun mulai juga harus ditolak.

Oleh karena itu, validasi tetap diperlukan untuk memeriksa aturan yang tidak dapat dijamin hanya melalui jenis input.

## AI Usage Disclosure - Week 8

Pada pengerjaan Tutorial 09 dan Tugas 8, saya menggunakan ChatGPT dari OpenAI sebagai alat bantu untuk memahami requirement resmi, merencanakan implementasi Flutter, meninjau source code, membantu debugging, melakukan pengujian, serta menyusun dokumentasi dan jawaban reflektif.

Penggunaan AI tidak hanya terbatas pada penjelasan konsep. AI juga menyediakan contoh implementasi formulir, navigasi, validasi input, dan widget testing yang saya gunakan sebagai dasar pengembangan aplikasi.

Seluruh perubahan diterapkan pada project Flutter lokal menggunakan Visual Studio Code. Hasil implementasi kemudian diperiksa menggunakan Flutter, Git, dan GitHub.

Saya juga memberikan dokumen tugas serta repository Django dan Flutter sebelumnya sebagai konteks agar saran yang diberikan AI tetap sesuai dengan struktur project dan requirement mata kuliah.

### Strategi Penggunaan AI

Saya menggunakan pendekatan source-first dengan memberikan dokumen resmi Tugas 8 kepada ChatGPT sebelum menentukan langkah implementasi.

Saya juga memberikan tautan repository Django dan Flutter agar AI dapat membandingkan struktur project, mengidentifikasi fitur yang sudah tersedia, serta menentukan bagian yang perlu dikembangkan.

Strategi utama saya adalah membatasi perubahan pada fitur yang relevan dengan requirement tugas. Saya meminta AI menyusun workflow dengan implementasi seminimal mungkin, tetapi tetap mempertimbangkan seluruh kriteria penilaian, termasuk fitur tambahan untuk mencapai nilai maksimal.

Pengerjaan dibagi menjadi beberapa tahap:

1. Memeriksa kondisi repository Flutter dan membuat branch `tugas-8-flutter`.
2. Membuat formulir Tambah Edukasi berdasarkan model Education pada project Django.
3. Menghubungkan formulir dengan kartu aksi di halaman utama serta navigasi Drawer.
4. Melakukan pengujian, memperbaiki responsivitas, dan menangani kesalahan pada aplikasi.
5. Memperbarui README, menjawab pertanyaan reflektif, serta mempersiapkan commit dan pengumpulan tugas.

Saya memilih formulir Edukasi karena model Education sudah tersedia pada project Django sebelumnya. Dengan demikian, struktur input dapat mengikuti model yang sudah ada tanpa perlu membuat fitur baru yang tidak berkaitan dengan project.

Saya juga membatasi implementasi agar tetap berfokus pada materi navigasi dan formulir Flutter. Integrasi API Django, autentikasi, serta penyimpanan data ke database belum ditambahkan karena tidak termasuk kebutuhan utama Tugas 8.

### Bagian yang Dibantu AI

AI digunakan untuk membantu:

- Memahami instruksi resmi dan rubrik penilaian Tugas 8.
- Memeriksa struktur repository Flutter setelah pengerjaan Tugas 7 dan Tutorial 09.
- Membandingkan model pada repository Django dengan kebutuhan formulir Flutter.
- Menentukan formulir Edukasi sebagai fitur baru yang sesuai dengan project portofolio.
- Menyusun workflow pengerjaan secara bertahap.
- Memberikan panduan penggunaan Git untuk membuat branch baru tanpa mengganggu branch utama.
- Menyediakan contoh kode StatefulWidget untuk halaman formulir.
- Menjelaskan penggunaan Form dan GlobalKey<FormState>.
- Membuat input nama institusi, program studi, tahun mulai, dan tahun selesai.
- Menambahkan validator untuk memeriksa input wajib dan format tahun.
- Memastikan tahun selesai tidak lebih awal daripada tahun mulai.
- Menambahkan SwitchListTile sebagai fitur tambahan untuk pendidikan yang masih berlangsung.
- Menggunakan AlertDialog untuk menampilkan ringkasan data formulir.
- Menghubungkan kartu Tambah Edukasi dengan EducationFormPage menggunakan Navigator.
- Menambahkan navigasi Add Education pada Drawer.
- Menjelaskan perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop().
- Memperbaiki tata letak agar dapat digunakan pada layar dengan ukuran berbeda.
- Memperbarui automated widget testing sesuai dengan perubahan fitur.
- Membuat pengujian untuk navigasi, validasi formulir, dan dialog.
- Membantu membaca serta menganalisis output flutter analyze dan flutter test.
- Mengidentifikasi masalah RenderFlex overflow pada komponen DrawerHeader.
- Memberikan saran perbaikan berdasarkan source code dan pesan kesalahan.
- Menyusun dokumentasi perkembangan project dan jawaban empat pertanyaan reflektif.
- Memberikan panduan commit, push, serta pengumpulan tugas menggunakan tautan commit GitHub.

### Keterbatasan AI dan Pemeriksaan Manual

Selama pengerjaan Tugas 8, saya menemukan bahwa saran AI tidak selalu langsung sesuai dengan kondisi project. Beberapa solusi yang diberikan masih membutuhkan penyesuaian dan pengujian tambahan.

Salah satu masalah terjadi ketika penambahan widget test baru. Instruksi awal AI diberikan dalam beberapa potongan kode yang harus digabungkan dengan pengujian sebelumnya.

Ketika potongan tersebut ditambahkan, beberapa pemanggilan testWidgets berada di luar fungsi main(). Akibatnya, Dart menampilkan banyak kesalahan sintaksis, seperti Expected an identifier dan duplicate definition.

Masalah tersebut diperbaiki dengan menyusun ulang seluruh isi widget_test.dart agar semua pengujian berada di dalam fungsi main(). Perbaikan ini menunjukkan pentingnya memahami struktur kode sebelum menggabungkan contoh implementasi dari AI.

Masalah berikutnya terjadi pada pengujian formulir Edukasi. Salah satu test gagal karena tombol Simpan tidak menerima interaksi saat pengujian berlangsung.

Dari output Flutter, ditemukan bahwa lokasi klik pengujian mengenai elemen lain pada layar. AI kemudian menyarankan pemeriksaan terhadap perilaku SnackBar dan navigasi agar elemen tersebut tidak mengganggu interaksi pada halaman formulir.

Selain itu, terdapat masalah RenderFlex overflow ketika menjalankan pengujian navigasi Drawer. Pada awalnya, AI memperkirakan bahwa masalah tersebut berasal dari struktur halaman utama karena jumlah kartu aksi bertambah dari tiga menjadi empat.

Berdasarkan dugaan tersebut, dilakukan penyesuaian layout menggunakan SingleChildScrollView, pengaturan GridView, dan komponen responsif lainnya.

Namun, perubahan tersebut belum menyelesaikan kegagalan pengujian Drawer.

Setelah saya memberikan output error yang lebih lengkap, ditemukan bahwa sumber overflow sebenarnya berada pada Column di dalam DrawerHeader pada file left_drawer.dart.

Pesan Flutter menunjukkan bahwa konten DrawerHeader melebihi ruang yang tersedia sebesar 15 piksel. Masalah tersebut menyebabkan pengujian gagal dan memunculkan beberapa pesan error lanjutan dari Flutter Widget Inspector.

Perbaikannya dilakukan dengan menyederhanakan isi DrawerHeader dan mengurangi kebutuhan ruang vertikal pada bagian tersebut.

Dari pengalaman ini, saya memahami bahwa AI dapat memberikan dugaan penyebab error yang belum tentu sesuai dengan kondisi sebenarnya. Sebuah solusi juga dapat terlihat benar secara sintaksis, tetapi belum tentu menyelesaikan masalah ketika aplikasi dijalankan.

Oleh karena itu, saya tidak hanya mengandalkan penjelasan AI, tetapi juga memeriksa source code, output terminal, dan lokasi widget yang disebutkan dalam pesan error.

Pemeriksaan dilakukan menggunakan flutter analyze untuk mendeteksi masalah analisis statis dan flutter test untuk menguji perilaku aplikasi. Pengujian secara langsung melalui browser juga digunakan untuk memeriksa tampilan dan navigasi.

Proses tersebut membantu membedakan kesalahan sintaksis, kesalahan layout, dan masalah interaksi pada widget testing.

### AI Prompting Log - Week 8

Berikut beberapa contoh prompt yang merepresentasikan instruksi selama pengerjaan Tutorial 09 dan Tugas 8. Contoh ditulis kembali menggunakan bahasa formal agar konsisten dengan dokumentasi project.

- "Baca requirement resmi Tugas 8 dan bantu saya memahami seluruh ketentuan serta rubrik penilaiannya."
- "Bandingkan repository Django dan Flutter saya untuk menentukan fitur yang paling sesuai dengan kebutuhan Tugas 8."
- "Buat workflow pengerjaan secara bertahap dengan implementasi minimal, tetapi tetap memenuhi seluruh kriteria penilaian."
- "Periksa kondisi repository Flutter saya dan jelaskan cara membuat branch baru untuk Tugas 8 tanpa mengganggu hasil tugas sebelumnya."
- "Bantu membuat formulir Tambah Edukasi menggunakan StatefulWidget dan sesuaikan atributnya dengan model Education pada project Django."
- "Jelaskan penggunaan Form, GlobalKey<FormState>, dan validator untuk memastikan seluruh input memenuhi ketentuan."
- "Tambahkan validasi tahun mulai dan tahun selesai agar tahun selesai tidak lebih awal daripada tahun mulai."
- "Tambahkan fitur interaktif sederhana yang relevan dengan formulir untuk memenuhi kriteria fitur tambahan."
- "Bagaimana cara menggunakan SwitchListTile untuk menandai pendidikan yang masih berlangsung dan menyesuaikan input tahun selesai?"
- "Bantu menghubungkan halaman Tambah Edukasi dengan kartu aksi di halaman utama menggunakan Navigator.push()."
- "Tambahkan menu Add Education pada Drawer dan pastikan pengguna dapat kembali ke halaman utama."
- "Jelaskan perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() berdasarkan implementasi aplikasi saya."
- "Bantu memperbaiki responsivitas halaman agar formulir dan kartu aksi tetap dapat digunakan pada layar kecil."
- "Perbarui widget testing agar sesuai dengan empat kartu aksi dan fitur formulir Edukasi."
- "Buat kode widget_test.dart secara lengkap agar seluruh pengujian berada pada struktur yang benar."
- "Analisis output flutter analyze dan flutter test saya, kemudian jelaskan penyebab error berdasarkan pesan yang ditampilkan."
- "Mengapa test navigasi Drawer masih gagal meskipun saya sudah memperbaiki struktur navigasinya?"
- "Periksa pesan RenderFlex overflow dan tentukan file serta widget yang menyebabkan masalah."
- "Bagaimana cara memperbaiki DrawerHeader agar tidak menyebabkan overflow pada pengujian Flutter?"
- "Periksa apakah implementasi formulir, navigasi, validasi, dan fitur tambahan sudah sesuai dengan requirement Tugas 8."
- "Bantu memperbarui README dengan struktur dan gaya dokumentasi yang konsisten dengan Tugas 7 sebelumnya."
- "Susun jawaban empat pertanyaan reflektif berdasarkan implementasi Flutter yang sudah dibuat."
- "Buat AI Usage Disclosure yang menjelaskan strategi prompting, bagian yang dibantu AI, keterbatasan, dan evaluasi penggunaan AI."
- "Berikan panduan penggunaan Git untuk commit, push, merge ke branch main, dan mendapatkan tautan commit final untuk pengumpulan."

Prompting dilakukan secara bertahap dengan memberikan dokumen resmi, tautan repository, potongan source code, serta hasil terminal sebagai konteks.

Ketika mengalami kendala, saya memberikan pesan error yang lebih lengkap agar AI dapat memperbaiki analisisnya berdasarkan informasi yang lebih spesifik.

Saya juga meminta solusi yang mempertahankan fitur sebelumnya agar pengerjaan Tugas 8 tidak mengganggu hasil Tugas 7 dan Tutorial 09.

### Evaluasi Penggunaan AI

AI membantu mempercepat proses pengembangan aplikasi, terutama dalam memahami konsep Flutter yang berkaitan dengan navigasi, StatefulWidget, formulir, validasi, dan pengujian otomatis.

Pembagian pekerjaan menjadi beberapa tahap juga membantu menjaga pengerjaan tetap terarah. Setiap tahap mempunyai tujuan yang jelas, sehingga perubahan dapat diperiksa sebelum melanjutkan ke bagian berikutnya.

Namun, pengalaman debugging menunjukkan bahwa AI tetap mempunyai keterbatasan. Beberapa instruksi yang diberikan tidak langsung sesuai dengan struktur kode, sementara beberapa dugaan penyebab error perlu diperbaiki setelah informasi tambahan tersedia.

Kesalahan pada widget testing dan DrawerHeader menjadi contoh bahwa hasil AI tidak dapat langsung dianggap benar tanpa pengujian.

Saya juga memahami bahwa flutter analyze dan flutter test mempunyai fungsi yang berbeda. Kode yang tidak menghasilkan masalah pada analisis statis masih dapat mengalami kegagalan saat pengujian perilaku atau layout.

Oleh karena itu, penggunaan AI perlu dipadukan dengan pemahaman terhadap source code, pemeriksaan output terminal, dan pengujian secara langsung.

Secara keseluruhan, AI berperan sebagai alat bantu pembelajaran, implementasi, debugging, dan dokumentasi. Namun, pemeriksaan terhadap hasil implementasi tetap diperlukan agar aplikasi sesuai dengan requirement dan dapat dipertanggungjawabkan.


## References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [PBP Tutorial 8](https://pbp.cs.ui.ac.id/tutorial/tutorial-8.html)
- [PBP Individual Assignment 7](https://pbp.cs.ui.ac.id/assignments/individual/tugas-7.html)
- [MyPortfolio Django Repository](https://github.com/naufalkhairiy/myportofolio)
