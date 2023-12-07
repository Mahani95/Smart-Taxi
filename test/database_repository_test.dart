import 'package:p11/data/DatabaseRepository.dart';
import 'package:test/test.dart';
import 'package:p11/class/driver.dart';
import 'package:p11/class/user.dart';

void main() {
  group('DatabaseRepository Tests', () {
    DatabaseRepository databaseRepository = DatabaseRepository();

    test('isStrongPassword() should return true for a strong password', () {
      expect(databaseRepository.isStrongPassword('Strong123'), true);
    });

    test('isStrongPassword() should return false for a weak password', () {
      expect(databaseRepository.isStrongPassword('weak'), false);
    });

    test('addUser() should add a user to the users list', () {
      User newUser = User('TestUser', 123456, 'TestPassword');
      databaseRepository.addUser(newUser);

      expect(databaseRepository.getUsers().contains(newUser), true);
    });

    test('deleteUser() should remove a user from the users list', () {
      User newUser = User('TestUser', 123456, 'TestPassword');
      databaseRepository.addUser(newUser);
      databaseRepository.deleteUser(newUser);

      expect(databaseRepository.getUsers().contains(newUser), false);
    });

    // You can add similar tests for other methods

    test('isLogin() should return true for a valid user login', () {
      // Mock a user and add it to the repository
      User newUser = User('TestUser', 123456, 'TestPassword');
      databaseRepository.addUser(newUser);

      // Test the login functionality
      expect(databaseRepository.isLogin(databaseRepository), true);
    });

    test('isDriverLogin() should return true for a valid driver login', () {
      // Mock a driver and add it to the repository
      Driver newDriver = Driver('TestDriver', 789012, 123456, 'TestPassword');
      databaseRepository.addDriver(newDriver);

      // Test the driver login functionality
      expect(databaseRepository.isDriverLogin(databaseRepository), true);
    });
  });
}
