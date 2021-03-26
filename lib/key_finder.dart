import 'key_finder_stub.dart'
    if (dart.library.html)'package:different_dependencies_specific_platform/web_key_finder.dart'
    if (dart.library.io) 'package:different_dependencies_specific_platform/mobile_key_finder.dart';

abstract class KeyFinder {
  String getKeyValue(String key) {
    return "I am from the interface";
  }

  void setKeyValue(String key, String value) {}

  factory KeyFinder() => getKeyFinder();
}
