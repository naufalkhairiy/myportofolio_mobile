import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  void _navigate(BuildContext context, Widget page) {
    final navigator = Navigator.of(context);

    navigator.pop();

    navigator.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
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
        ],
      ),
    );
  }
}
