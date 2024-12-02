import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  static late SharedPreferences sharedPreferences;
  AppService._() {
    initializeSharedPreferences();
  }
 static Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

class ShardedPrefKey {
  static String step = "Step";
}
