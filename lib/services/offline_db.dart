import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_first_app_flutter/interfaces/db/create.dart';
import 'package:offline_first_app_flutter/interfaces/db/get.dart';
import 'package:offline_first_app_flutter/interfaces/db/update.dart';

class OfflineDb implements DbCreate, DbGet, DbUpdate {
  final String dbName;
  dynamic instance;

  OfflineDb(this.dbName) {
    _openDB();
  }

  static setupDB() async {
    await Hive.initFlutter();
  }

  void _openDB() async {
    instance = await Hive.openBox(dbName);
  }

  @override
  void create(String key, dynamic data) {
    instance.put(key, data);
  }

  @override
  dynamic get(String key) {
    return instance.get(key);
  }

  @override
  void update(String key, dynamic data) {
    instance.put(key, data);
  }
}
