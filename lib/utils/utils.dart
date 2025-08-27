/// utils.dart
///
/// General utility helpers and extensions used across the application.

extension NullableStringExtensions on String? {
  /// Returns true if the string is null or empty after trimming.
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;
}

