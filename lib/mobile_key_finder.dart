import 'package:different_dependencies_specific_platform/key_finder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeyFinder implements KeyFinder {
  SharedPreferences _instance;

  SharedPrefKeyFinder() {
    SharedPreferences.getInstance().then((preference) {
      _instance = preference;
      _instance.setString("MyKey", "I am from Shared Preference");
      print("Shared preferences has been initialized");
    });
  }

  @override
  String getKeyValue(String key) {
    return _instance?.getString(key) ??
        'shared preference is not yet initialized';
  }

  @override
  void setKeyValue(String key, String value) {
    _instance?.setString(key, value);
  }
}

KeyFinder getKeyFinder() => SharedPrefKeyFinder();
