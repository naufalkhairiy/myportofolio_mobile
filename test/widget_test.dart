import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  // TEST 1: Identitas pemilik portofolio
  testWidgets('Menampilkan identitas pemilik portofolio', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2506621850'), findsOneWidget);
    expect(find.text('Naufal Khairiy Zulkarnain Sormin'), findsOneWidget);
    expect(find.text('PBP D'), findsOneWidget);
  });

  // TEST 2: Empat tombol aksi tersedia
  testWidgets('Menampilkan empat tombol aksi', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Tambah Edukasi'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  // TEST 3: Warna kartu aksi sesuai
  testWidgets('Tombol aksi mempunyai warna yang sesuai', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final cards = tester.widgetList<ItemCard>(find.byType(ItemCard)).toList();

    expect(cards.length, 4);
    expect(cards[0].item.color, Colors.blue);
    expect(cards[1].item.color, Colors.green);
    expect(cards[2].item.color, Colors.orange);
    expect(cards[3].item.color, Colors.red);
  });

  // TEST 4: SnackBar tombol Lihat Proyek
  testWidgets('Tombol Lihat Proyek menampilkan data API', (
    WidgetTester tester,
  ) async {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response(
          '''
          [
            {
              "id": "project-1",
              "title": "Proyek Testing",
              "description": "Deskripsi proyek testing",
              "tech_stack": "Django dan Flutter",
              "project_url": "https://example.com",
              "project_image_url": ""
            }
          ]
          ''',
          200,
          headers: {'content-type': 'application/json'},
        );
      }),
    );

    addTearDown(client.close);

    await tester.pumpWidget(MyApp(apiClient: client));

    await tester.ensureVisible(find.text('Lihat Proyek'));
    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();

    expect(find.text('Daftar Proyek'), findsOneWidget);
    expect(find.text('Proyek Testing'), findsOneWidget);
    expect(find.text('Django dan Flutter'), findsOneWidget);

    await tester.tap(find.text('Proyek Testing'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Proyek'), findsOneWidget);
    expect(find.text('Deskripsi proyek testing'), findsOneWidget);
    expect(find.text('https://example.com'), findsOneWidget);
  });
  // TEST 5: Dialog informasi aplikasi
  testWidgets('Dialog informasi dapat dibuka dan ditutup', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.info_outline), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Tutup'), findsOneWidget);

    await tester.tap(find.text('Tutup'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });

  // TEST 6: Navigasi kartu Tambah Edukasi
  testWidgets('Kartu Tambah Edukasi membuka formulir', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    expect(find.text('Informasi Pendidikan'), findsOneWidget);
    expect(find.text('Simpan'), findsOneWidget);
  });

  // TEST 7: Navigasi melalui Drawer
  testWidgets('Drawer membuka Edukasi dan kembali Home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Buka Drawer dari Home
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Pilih Add Education
    await tester.tap(find.text('Add Education'));
    await tester.pumpAndSettle();

    expect(find.text('Informasi Pendidikan'), findsOneWidget);

    // Buka Drawer dari halaman Edukasi
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Kembali ke Home
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Edukasi'), findsOneWidget);
    expect(find.text('Lihat Proyek'), findsOneWidget);
  });

  // TEST 8: Validasi, Switch, dan Dialog Ringkasan
  testWidgets('Form Edukasi memvalidasi dan menampilkan dialog', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Buka formulir Edukasi
    await tester.ensureVisible(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tambah Edukasi'));
    await tester.pumpAndSettle();

    // Coba simpan formulir kosong
    await tester.ensureVisible(find.text('Simpan'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Form kosong harus ditolak
    expect(find.text('Nama institusi tidak boleh kosong!'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);

    // Ambil seluruh input TextFormField
    final fields = find.byType(TextFormField);

    // Isi nama institusi
    await tester.ensureVisible(fields.at(0));
    await tester.pumpAndSettle();
    await tester.enterText(fields.at(0), 'Universitas Indonesia');

    // Isi tahun mulai
    await tester.ensureVisible(fields.at(2));
    await tester.pumpAndSettle();
    await tester.enterText(fields.at(2), '2025');

    // Matikan Switch "Masih menempuh pendidikan"
    await tester.ensureVisible(find.byType(SwitchListTile));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();

    // Masukkan tahun selesai yang salah
    await tester.ensureVisible(fields.at(3));
    await tester.pumpAndSettle();
    await tester.enterText(fields.at(3), '2024');

    // Coba Simpan
    await tester.ensureVisible(find.text('Simpan'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Tahun selesai sebelum tahun mulai harus ditolak
    expect(find.text('Tahun selesai tidak boleh lebih awal'), findsOneWidget);

    // Perbaiki tahun selesai menjadi valid
    await tester.ensureVisible(fields.at(3));
    await tester.pumpAndSettle();
    await tester.enterText(fields.at(3), '2028');

    // Simpan kembali
    await tester.ensureVisible(find.text('Simpan'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Dialog ringkasan harus muncul
    expect(find.text('Ringkasan Edukasi'), findsOneWidget);

    expect(
      find.textContaining('Institusi: Universitas Indonesia'),
      findsOneWidget,
    );

    expect(find.textContaining('Tahun Selesai: 2028'), findsOneWidget);

    // Tutup dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });
}
