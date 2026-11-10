// ==========================================
// LATIHAN 4: Structured Logger dengan kDebugMode
// ==========================================
import 'package:flutter/foundation.dart';

class Logger {
  static void debug(String message, {String tag = 'DEBUG'}) {
    if (kDebugMode) {
      print('[$tag] 🐛 DEBUG: $message');
    }
  }

  static void info(String message, {String tag = 'INFO'}) {
    if (kDebugMode) {
      print('[$tag] ℹ️ INFO: $message');
    }
  }

  static void warning(String message, {String tag = 'WARNING'}) {
    if (kDebugMode) {
      print('[$tag] ⚠️ WARNING: $message');
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace, String tag = 'ERROR']) {
    if (kDebugMode) {
      print('[$tag] ❌ ERROR: $message');
      if (error != null) print('Details: $error');
      if (stackTrace != null) print('Stacktrace:\n$stackTrace');
    }
  }
  static void logSecureAction(String actionName) {
    if (kDebugMode) {
      print('[SECURE] 🔒 Action executed: $actionName [DATA REDACTED]');
    }
  }
}