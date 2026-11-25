import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  test('getProjects returns project data', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.path, '/api/v1/projects/');

        return http.Response(
          jsonEncode([
            {
              'id': '1',
              'title': 'MyPortfolio',
              'description': 'Portfolio application',
              'tech_stack': 'Flutter',
              'project_url': 'https://example.com',
              'project_image_url': '',
            },
          ]),
          200,
        );
      }),
    );

    addTearDown(client.close);

    final projects = await client.getProjects();

    expect(projects.length, 1);
    expect(projects.first.title, 'MyPortfolio');
    expect(projects.first.techStack, 'Flutter');
  });

  test('createProject sends JSON and authorization token', () async {
    const project = Project(
      title: 'New Project',
      description: 'Project description',
      techStack: 'Django',
      projectUrl: 'https://example.com',
    );

    final client = ApiClient(
      client: MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.path, '/api/v1/projects/');
        expect(request.headers['authorization'], 'Token test-token');

        final body = jsonDecode(request.body) as Map<String, dynamic>;

        expect(body['title'], 'New Project');
        expect(body.containsKey('id'), isFalse);

        return http.Response(jsonEncode({...body, 'id': 'new-id'}), 201);
      }),
    );

    addTearDown(client.close);

    final result = await client.createProject(project, token: 'test-token');

    expect(result.id, 'new-id');
    expect(result.title, 'New Project');
  });

  test('obtainToken returns authentication token', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.path, '/api/v1/auth/token/');

        final body = jsonDecode(request.body) as Map<String, dynamic>;

        expect(body['username'], 'admin');
        expect(body['password'], 'password');

        return http.Response('{"token":"test-token"}', 200);
      }),
    );

    addTearDown(client.close);

    final token = await client.obtainToken('admin', 'password');

    expect(token, 'test-token');
  });

  test('logout sends token and accepts status 204', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.path, '/api/v1/auth/logout/');
        expect(request.headers['authorization'], 'Token test-token');

        return http.Response('', 204);
      }),
    );

    addTearDown(client.close);

    await client.logout(token: 'test-token');
  });

  test('failed requests throw ApiException', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response('Server error', 500);
      }),
    );

    addTearDown(client.close);

    await expectLater(
      client.getProjects(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.statusCode,
          'statusCode',
          500,
        ),
      ),
    );
  });
}
