import 'package:shared_preferences/shared_preferences.dart';

class Counter {
  static final prefs = SharedPreferences.getInstance();

  static Future<int> getCount() async {
    return (await prefs).getInt('count') ?? 0;
  }

  static Future<void> setCount(int count) async {
    (await prefs).setInt('count', count);
  }
}
