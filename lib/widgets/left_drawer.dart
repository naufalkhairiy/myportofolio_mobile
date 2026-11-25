import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  void _navigate(BuildContext context, Widget page) {
    final navigator = Navigator.of(context);

    navigator.pop();

    navigator.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Portfolio',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              _navigate(context, const MyHomePage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: const Text('View Projects'),
            onTap: () {
              _navigate(context, const ProjectListScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),
            onTap: () async {
              final allowed = await ensureLoggedIn(context);

              if (!context.mounted || !allowed) return;

              _navigate(context, const ProjectFormPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('Add Education'),
            onTap: () {
              _navigate(context, const EducationFormPage());
            },
          ),
          const Divider(),
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () async {
                final loggedIn = await ensureLoggedIn(context);

                if (!context.mounted || !loggedIn) return;

                final messenger = ScaffoldMessenger.of(context);

                Navigator.pop(context);

                messenger.showSnackBar(
                  const SnackBar(content: Text('Login berhasil!')),
                );
              },
            ),
          if (isLoggedIn)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                final revoked = await context.read<AuthState>().logout();

                if (!context.mounted) return;

                final messenger = ScaffoldMessenger.of(context);

                Navigator.pop(context);

                messenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      revoked ? 'Logout berhasil!' : 'Logout lokal berhasil, tetapi token server belum terkonfirmasi dicabut.',
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
