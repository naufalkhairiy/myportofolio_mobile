import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';

void main() {
  test('AuthState starts without authentication', () {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response('', 200);
      }),
    );

    final auth = AuthState(client);

    addTearDown(client.close);
    addTearDown(auth.dispose);

    expect(auth.isLoggedIn, isFalse);
    expect(auth.token, isNull);
  });

  test('Login stores token and logout clears it', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        if (request.url.path == '/api/v1/auth/token/') {
          return http.Response('{"token":"test-token"}', 200);
        }

        if (request.url.path == '/api/v1/auth/logout/') {
          expect(request.headers['authorization'], 'Token test-token');

          return http.Response('', 204);
        }

        return http.Response('', 404);
      }),
    );

    final auth = AuthState(client);

    addTearDown(client.close);
    addTearDown(auth.dispose);

    int notifications = 0;

    auth.addListener(() {
      notifications++;
    });

    await auth.login('admin', 'password');

    expect(auth.isLoggedIn, isTrue);
    expect(auth.token, 'test-token');

    final revoked = await auth.logout();

    expect(revoked, isTrue);
    expect(auth.isLoggedIn, isFalse);
    expect(auth.token, isNull);
    expect(notifications, 2);
  });

  test('Failed login does not create authentication', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response('Invalid credentials', 400);
      }),
    );

    final auth = AuthState(client);

    addTearDown(client.close);
    addTearDown(auth.dispose);

    await expectLater(
      auth.login('invalid', 'invalid'),
      throwsA(isA<ApiException>()),
    );

    expect(auth.isLoggedIn, isFalse);
    expect(auth.token, isNull);
  });

  test('Logout clears local token even when API fails', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response('Server error', 500);
      }),
    );

    final auth = AuthState(client, initialToken: 'test-token');

    addTearDown(client.close);
    addTearDown(auth.dispose);

    final revoked = await auth.logout();

    expect(revoked, isFalse);
    expect(auth.isLoggedIn, isFalse);
    expect(auth.token, isNull);
  });
}
