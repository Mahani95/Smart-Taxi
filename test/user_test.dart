import 'package:p11/class/user.dart';
import 'package:test/test.dart';

void main() {
  group('User Class Tests', () {
    test('isStrongPassword returns true for a strong password', () {
      final user = User('John', 12345, 'StrongPassword123');
      expect(user.isStrongPassword('StrongPassword123'), true);
    });

    test('isStrongPassword returns false for a weak password', () {
      final user = User('Alice', 54321, 'Weak123');
      expect(user.isStrongPassword('Weak123'), false);
    });

    test('isVerifiUser returns true for valid code and password', () {
      final user = User('Bob', 98765, 'SecretPassword456');
      expect(user.isVerifiUser(98765, 'SecretPassword456'), true);
    });

    test('isVerifiUser returns false for invalid code and password', () {
      final user = User('Eve', 11111, 'Password123');
      expect(user.isVerifiUser(54321, 'WrongPassword789'), false);
    });
  });
}
