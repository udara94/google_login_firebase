import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get googleClientId {
    final clientId = dotenv.env['GOOGLE_CLIENT_ID'];
    if (clientId == null || clientId.isEmpty) {
      throw Exception('GOOGLE_CLIENT_ID not found in environment variables');
    }
    return clientId;
  }
}
