class TValidator {
  static String? validateEmptyTextField(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for Bangladeshi phone number validation (11 digits, valid prefixes)
    final phoneRegExp = RegExp(r'^(013|014|015|016|017|018|019)\d{8}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format. Enter 11 digits starting with a valid prefix (013, 014, 015, 016, 017, 018, 019).';
    }

    // If validation passes, return null (no error message).
    return null;
  }

// Helper function to add the +88 prefix
  String formatPhoneNumber(String phoneNumber) {
    return '+88$phoneNumber';
  }

  // Add more custom validators as needed for your specific requirements.
}
