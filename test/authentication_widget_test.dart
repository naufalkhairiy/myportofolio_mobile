import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Add Project requires authentication', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Tambah Proyek'));
    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(ProjectFormPage), findsNothing);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsNothing);
    expect(find.byType(ProjectFormPage), findsNothing);
  });

  testWidgets('Login validates empty input', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Login'));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

    await tester.pumpAndSettle();

    expect(find.text('Username tidak boleh kosong!'), findsOneWidget);

    expect(find.text('Password tidak boleh kosong!'), findsOneWidget);
  });

  testWidgets('Login allows project creation and logout', (
    WidgetTester tester,
  ) async {
    bool projectCreated = false;
    bool tokenRevoked = false;

    final client = ApiClient(
      client: MockClient((request) async {
        if (request.url.path == '/api/v1/auth/token/') {
          final body = jsonDecode(request.body) as Map<String, dynamic>;

          expect(body['username'], 'admin');
          expect(body['password'], 'password');

          return http.Response('{"token":"test-token"}', 200);
        }

        if (request.url.path == '/api/v1/projects/' &&
            request.method == 'POST') {
          expect(request.headers['authorization'], 'Token test-token');

          final body = jsonDecode(request.body) as Map<String, dynamic>;

          expect(body['title'], 'Proyek Testing');
          expect(body['tech_stack'], 'Flutter, Django');

          projectCreated = true;

          return http.Response(jsonEncode({...body, 'id': 'project-1'}), 201);
        }

        if (request.url.path == '/api/v1/auth/logout/') {
          expect(request.headers['authorization'], 'Token test-token');

          tokenRevoked = true;

          return http.Response('', 204);
        }

        return http.Response('', 404);
      }),
    );

    addTearDown(client.close);

    await tester.pumpWidget(MyApp(apiClient: client));

    await tester.ensureVisible(find.text('Tambah Proyek'));
    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    final loginFields = find.byType(TextFormField);

    await tester.enterText(loginFields.at(0), 'admin');
    await tester.enterText(loginFields.at(1), 'password');

    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Login'));

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

    await tester.pumpAndSettle();

    expect(find.byType(ProjectFormPage), findsOneWidget);

    final projectFields = find.byType(TextFormField);

    await tester.ensureVisible(projectFields.at(0));
    await tester.enterText(projectFields.at(0), 'Proyek Testing');

    await tester.ensureVisible(projectFields.at(1));
    await tester.enterText(projectFields.at(1), 'Deskripsi proyek testing');

    await tester.ensureVisible(projectFields.at(2));
    await tester.enterText(projectFields.at(2), 'Flutter, Django');

    await tester.ensureVisible(projectFields.at(3));
    await tester.enterText(projectFields.at(3), 'https://example.com');

    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(projectCreated, isTrue);

    expect(find.text('Proyek berhasil ditambahkan!'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    Navigator.of(tester.element(find.byType(ProjectFormPage))).pop();

    await tester.pumpAndSettle();

    expect(find.text('Logout'), findsOneWidget);

    await tester.ensureVisible(find.text('Logout'));
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    expect(tokenRevoked, isTrue);
    expect(find.text('Login'), findsOneWidget);
  });
}
