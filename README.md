# My Portfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter yang dibuat untuk mata kuliah Pemrograman Berbasis Platform di Universitas Indonesia.

## Author

- **Name:** Naufal Khairiy Zulkarnain Sormin
- **NPM:** 2506621850
- **Class:** PBP D

## Project Description

Project ini merupakan aplikasi portofolio pribadi berbasis Flutter yang dikembangkan untuk mata kuliah Pemrograman Berbasis Platform di Universitas Indonesia. Aplikasi ini merupakan versi mobile dari project website portofolio sebelumnya yang dibuat menggunakan Django.

Pada Tutorial 8, aplikasi dibangun menggunakan Flutter dan bahasa pemrograman Dart. Implementasi awal berfokus pada pembuatan halaman utama, pemisahan struktur kode, penggunaan StatelessWidget, serta pembuatan komponen antarmuka yang dapat digunakan kembali.

Pada Tugas 7, aplikasi dikembangkan lebih lanjut dengan menampilkan identitas pemilik portofolio, tiga tombol aksi yang mempunyai warna berbeda, feedback menggunakan SnackBar, serta fitur tambahan berupa dialog informasi aplikasi.

Aplikasi saat ini berfokus pada antarmuka Flutter dan belum terhubung dengan backend Django. Tombol Lihat Proyek, Tambah Proyek, dan Logout masih berupa simulasi interaksi menggunakan SnackBar.

Repository website Django dapat diakses melalui:
https://github.com/naufalkhairiy/myportofolio

## Main Features

- Menampilkan informasi pemilik portofolio berupa NPM, nama lengkap, dan kelas.
- Menggunakan tiga reusable InfoCard untuk menampilkan identitas.
- Menampilkan tiga tombol aksi: Lihat Proyek, Tambah Proyek, dan Logout.
- Menggunakan ItemCard sebagai reusable widget untuk tombol aksi.
- Menggunakan model ItemHomepage untuk menyimpan nama, ikon, dan warna tombol.
- Menerapkan warna berbeda pada setiap tombol: biru, hijau, dan merah.
- Menampilkan SnackBar ketika tombol aksi ditekan.
- Menggunakan GridView untuk menyusun tombol dalam tiga kolom.
- Menggunakan Material Design 3 dengan tema utama indigo.
- Menggunakan StatelessWidget untuk halaman utama.
- Memisahkan konfigurasi aplikasi di main.dart dari tampilan halaman di menu.dart.
- Menambahkan tombol informasi pada AppBar yang menampilkan AlertDialog berisi informasi aplikasi sebagai fitur interaktivitas tambahan.

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
│   └── menu.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

`main.dart` berfungsi sebagai entry point aplikasi dan tempat konfigurasi MaterialApp serta tema.

`menu.dart` berisi halaman MyHomePage, model ItemHomepage, komponen InfoCard, dan komponen ItemCard.

Direktori `test/` digunakan untuk pengujian widget Flutter.

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

## References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [PBP Tutorial 8](https://pbp.cs.ui.ac.id/tutorial/tutorial-8.html)
- [PBP Individual Assignment 7](https://pbp.cs.ui.ac.id/assignments/individual/tugas-7.html)
- [MyPortfolio Django Repository](https://github.com/naufalkhairiy/myportofolio)
