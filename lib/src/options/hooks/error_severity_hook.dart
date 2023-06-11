import 'package:analyzer/error/error.dart';
import 'package:dart_mappable/dart_mappable.dart';

class ErrorSeverityHook extends MappingHook {
  const ErrorSeverityHook();

  @override
  Object? beforeEncode(Object? value) {
    return switch (value) {
      ErrorSeverity.INFO => 'info',
      ErrorSeverity.WARNING => 'warning',
      ErrorSeverity.ERROR => 'error',
      ErrorSeverity.NONE => 'none',
      _ => null,
    };
  }

  @override
  Object? beforeDecode(Object? value) {
    return switch (value) {
      'info' => ErrorSeverity.INFO,
      'warning' => ErrorSeverity.WARNING,
      'error' => ErrorSeverity.ERROR,
      'none' => ErrorSeverity.NONE,
      _ => ErrorSeverity.INFO,
    };
  }
}
