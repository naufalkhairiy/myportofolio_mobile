import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String npm = '2506621850';
  final String nama = 'Naufal Khairiy Zulkarnain Sormin';
  final String kelas = 'PBP D';

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    final items = [
      const ItemHomepage('Lihat Proyek', Icons.folder, Colors.blue),
      const ItemHomepage('Tambah Proyek', Icons.add_circle, Colors.green),
      const ItemHomepage('Tambah Edukasi', Icons.school, Colors.orange),
      ItemHomepage(
        isLoggedIn ? 'Logout' : 'Login',
        isLoggedIn ? Icons.logout : Icons.login,
        Colors.red,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortofolio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Tentang Aplikasi',
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Text('Tentang MyPortofolio'),
                    content: const Text(
                      'MyPortofolio adalah aplikasi portofolio pribadi '
                      'milik Naufal Khairiy Zulkarnain Sormin.\n\n'
                      'NPM: 2506621850\n'
                      'Kelas: PBP D\n\n'
                      'Aplikasi ini dibuat menggunakan Flutter '
                      'untuk menampilkan informasi dan proyek portofolio.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              final isNarrow = availableWidth < 600;

              final infoWidth = isNarrow
                  ? availableWidth
                  : (availableWidth - 24) / 3;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      SizedBox(
                        width: infoWidth,
                        child: InfoCard(title: 'NPM', content: npm),
                      ),
                      SizedBox(
                        width: infoWidth,
                        child: InfoCard(title: 'Name', content: nama),
                      ),
                      SizedBox(
                        width: infoWidth,
                        child: InfoCard(title: 'Class', content: kelas),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Selamat datang di MyPortfolio Mobile!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 115,
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    children: items.map((item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}
