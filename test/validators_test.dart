// ==========================================
// LATIHAN 5: Unit Test untuk Validators
// ==========================================
import 'package:flutter_test/flutter_test.dart';
import 'package:securre_http/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    // Latihan 5a: Test isValidEmail()
    test('isValidEmail should return true for valid emails and false for invalid ones', () {
      expect(Validators.isValidEmail('test@example.com'), true);
      expect(Validators.isValidEmail('user.name@domain.co.id'), true);
      expect(Validators.isValidEmail('invalid-email'), false);
      expect(Validators.isValidEmail('test@domain'), false);
    });

    // Tambahan test Phone & URL (Latihan 3)
    test('validatePhone should validate phone number correctly', () {
      expect(Validators.validatePhone('081234567890'), true); // 12 digit
      expect(Validators.validatePhone('12345'), false); // Terlalu pendek
      expect(Validators.validatePhone('abc08123456789'), false); // Mengandung huruf
    });

    test('validateUrl should validate URL correctly', () {
      expect(Validators.validateUrl('https://example.com'), true);
      expect(Validators.validateUrl('http://sub.domain.co.id/path?query=1'), true);
      expect(Validators.validateUrl('ftp://example.com'), false);
      expect(Validators.validateUrl('not-a-url'), false);
    });

    test('validatePassword should validate password complexity correctly', () {
      expect(Validators.validatePassword('Password123!'), true);
      expect(Validators.validatePassword('weakpass'), false); // Tidak ada angka/simbol/kapital
      expect(Validators.validatePassword('Pass1!'), false); // Kurang dari 8 karakter
    });

    // Latihan 5b: Test sanitize() dengan input berbahaya
    test('sanitize should remove HTML tags or malicious scripts', () {
      const maliciousInput = '<script>alert("XSS")</script>Hello World';
      final sanitized = Validators.sanitize(maliciousInput);
      expect(sanitized, 'alert("XSS")Hello World');
    });

    // Latihan 5c: Test validateText() dengan berbagai panjang
    test('validateText should check length constraints properly', () {
      expect(Validators.validateText('Flutter', minLength: 3, maxLength: 10), true);
      expect(Validators.validateText('Hi', minLength: 3, maxLength: 10), false); // Terlalu pendek
      expect(Validators.validateText('ThisIsTooLongTextForValidation', minLength: 1, maxLength: 5), false); // Terlalu panjang
    });
  });
}