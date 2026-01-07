class NameValidator {
  
  /// Validates player name.
  /// Rules: Max 10 chars, Uppercase only (A-Z, 0-9).
  static String? validateName(String name) {
    if (name.isEmpty) return "Name cannot be empty";
    if (name.length > 10) return "Name too long (max 10)";
    
    final validRegex = RegExp(r'^[A-Z0-9]+$');
    if (!validRegex.hasMatch(name)) return "Must be UPPERCASE letters/numbers only";
    
    return null; // Valid
  }
}
