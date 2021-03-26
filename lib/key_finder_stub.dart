import 'package:different_dependencies_specific_platform/key_finder.dart';

KeyFinder getKeyFinder() => throw UnsupportedError(
  'Cannot create a keyfinder without the packages dart:html or package:shared_preferences'
);