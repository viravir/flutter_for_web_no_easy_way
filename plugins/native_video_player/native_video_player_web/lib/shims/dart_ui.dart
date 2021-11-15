// Have to mock dart_ui due to https://github.com/flutter/flutter/issues/41563
export 'dart_ui_mock.dart' if (dart.library.html) 'dart_ui_real.dart';
