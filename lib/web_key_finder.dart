import 'dart:html';
import 'key_finder.dart';

Window windowLoc;

class WebKeyFinder implements KeyFinder {
  WebKeyFinder() {
    windowLoc = window;
    print("Window is initialized");

    windowLoc.localStorage["MyKey"] = "I am from web local storage";
  }

  @override
  String getKeyValue(String key) {
    return windowLoc.localStorage[key];
  }

  @override
  void setKeyValue(String key, String value) {
    windowLoc.localStorage[key] = value;
  }
}

KeyFinder getKeyFinder() => WebKeyFinder();
