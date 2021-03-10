library qwxcomponents;

import 'dart:async';

import 'package:flutter/services.dart';
export 'GUI/VComponents.dart';
export 'Bloc/BlocVsbLib.dart';
export 'globaldeclarations.dart';

class QwxComponents {
  static const MethodChannel _channel = const MethodChannel('qwxcomponents');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
