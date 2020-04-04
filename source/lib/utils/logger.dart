import 'dart:developer' as developer;

import 'package:felix_flutter/configs/application.dart';

class UtilLogger {
  static const String TAG = "FELIX";

  static log([String tag = TAG, dynamic msg]) {
    if (Application.debug) {
      developer.log('$msg', name: tag);
    }
  }

  ///Singleton factory
  static final UtilLogger _instance = UtilLogger._internal();

  factory UtilLogger() {
    return _instance;
  }

  UtilLogger._internal();
}
