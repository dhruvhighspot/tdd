import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/api/app_url.dart';

void main() {
  test('ApiUrl Test', () {
    String url = 'https://json-placeholder.mock.beeceptor.com/';

    // Test the baseUrl
    expect(ApiUrl.baseUrl, url);

    // Test the loginUrl
    expect(ApiUrl.loginUrl, '${url}login');

    // Test the userListUrl
    expect(ApiUrl.userListUrl, '${url}users');

    // Test the userItemUrl
    expect(ApiUrl.userItemUrl, '${url}users/');
  });
}
