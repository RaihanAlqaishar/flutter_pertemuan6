import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://jsonplaceholder.typicode.com';
  static String get apiKey => dotenv.env['API_KEY'] ?? 'dummy_api_key';
  static const int timeoutSeconds = 10;

  static bool isConfigured() {
    return baseUrl.isNotEmpty && apiKey.isNotEmpty;
  }
}