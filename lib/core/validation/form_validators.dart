/// Lightweight, reusable input checks (no Flutter dependency).
abstract class FormValidators {
  static bool hasMinTrimmedLength(String value, int min) =>
      value.trim().length >= min;

  static bool isValidEmail(String value) {
    final v = value.trim();
    if (v.isEmpty) return false;
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v);
  }
}
