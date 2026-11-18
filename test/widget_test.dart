import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

void main() {
  // Test 1: Memastikan identitas pemilik ditampilkan.
  testWidgets('Menampilkan identitas pemilik portofolio', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2506621850'), findsOneWidget);
    expect(find.text('Naufal Khairiy Zulkarnain Sormin'), findsOneWidget);
    expect(find.text('PBP D'), findsOneWidget);
  });

  // Test 2: Memastikan ketiga tombol tersedia.
  testWidgets('Menampilkan tiga tombol aksi', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  // Test 3: Memastikan warna setiap tombol berbeda.
  testWidgets('Tombol aksi mempunyai warna yang sesuai', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final cards = tester.widgetList<ItemCard>(find.byType(ItemCard)).toList();

    expect(cards.length, 3);
    expect(cards[0].item.color, Colors.blue);
    expect(cards[1].item.color, Colors.green);
    expect(cards[2].item.color, Colors.red);
  });

  // Test 4: Memastikan SnackBar muncul saat tombol ditekan.
  testWidgets('Tombol Lihat Proyek menampilkan SnackBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();

    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });

  // Test 5: Memastikan fitur ekstra dialog berfungsi.

  testWidgets('Dialog informasi dapat dibuka dan ditutup', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Pastikan tombol informasi tersedia.
    expect(find.byIcon(Icons.info_outline), findsOneWidget);

    // Tekan tombol informasi.
    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    // Pastikan dialog benar-benar muncul.
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Tutup'), findsOneWidget);

    // Tekan tombol tutup.
    await tester.tap(find.text('Tutup'));
    await tester.pumpAndSettle();

    // Pastikan dialog sudah tertutup.
    expect(find.byType(AlertDialog), findsNothing);
  });
}
