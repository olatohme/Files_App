

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Securestorage {
  final Storage = new FlutterSecureStorage();
  Future<void> save(String key, String value) async {
    await Storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
     String? value = await Storage.read(key: key);
     return value ?? '';
  }
}
