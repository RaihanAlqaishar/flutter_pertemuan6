// ==========================================
// LATIHAN 3: Validators (Phone, URL, Password, Email)
// ==========================================
class Validators {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  static bool validatePhone(String phone) {
    final phoneRegExp = RegExp(r'^[0-9]{10,13}$');
    return phoneRegExp.hasMatch(phone);
  }

  static bool validateUrl(String url) {
    final urlRegExp = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
    return urlRegExp.hasMatch(url);
  }

  static bool validatePassword(String password) {
    if (password.length < 8) return false;
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    
    return hasUppercase && hasDigits && hasSpecialCharacters;
  }

  static String sanitize(String input) {
    return input.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  static bool validateText(String text, {int minLength = 1, int maxLength = 255}) {
    return text.length >= minLength && text.length <= maxLength;
  }
}