import 'dart:io';

import 'package:p11/class/driver.dart';
import 'package:p11/class/user.dart';
import 'package:p11/class/vehicle.dart';

class DatabaseRepository {
  // private attributes
  List<User> _users = [];
  List<Driver> _drivers = [];
  List<Vehicle> _vehicles = [];

  DatabaseRepository();

  List<User> getUsers() {
    return _users;
  }

  void addUser(User user) {
    _users.add(user);
  }

  void deleteUser(User user) {
    _users.remove(user);
  }

  List<Driver> getDrivers() {
    return _drivers;
  }

  void addDriver(Driver driver) {
    _drivers.add(driver);
  }

  void deleteDriver(Driver driver) {
    _drivers.remove(driver);
  }

  List<Vehicle> getVehicles() {
    return _vehicles;
  }

  void addVehicle(Vehicle vehicle) {
    _vehicles.add(vehicle);
  }

  void deleteVehicle(Vehicle vehicle) {
    _vehicles.remove(vehicle);
  }

  User? findUserByName(String name) {
    return _users.firstWhere((user) => user.name == name);
  }

  Driver? findDriverByName(String code) {
    return _drivers.firstWhere((driver) => driver.code == code);
  }

  bool isStrongPassword(String password) {
    if (password.length < 8) {
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  void userRegistri() {
    DatabaseRepository databaseRepository = DatabaseRepository();

    print(
        "Bitte geben Sie den Namen des Benutzers ein um dich zu Registrieren: ");
    String userName = stdin.readLineSync()!;

    print(
        "Bitte geben Sie den Telefonnummer des Benutzers ein um dich zu Registrieren: ");
    int userCode = int.tryParse(stdin.readLineSync()!) ?? 0;

    print(
        "Bitte geben Sie das Passwort des Benutzers ein um dich zu Registrieren: ");
    String userPassword = stdin.readLineSync()!;

    if (isStrongPassword(userPassword)) {
      User newUser = User(userName, userCode, userPassword);
      databaseRepository.addUser(newUser);
    } else {
      print(
          "Das Passwort entspricht nicht den Anforderungen. Bitte geben Sie das Passwort erneut ein.");
      userRegistri();
    }
  }

  void driverRegistri() {
    DatabaseRepository databaseRepository = DatabaseRepository();

    print(
        "Bitte geben Sie den Namen des Fahrers ein um dich zu Registrieren: ");
    String driverName = stdin.readLineSync()!;

    print(
        "Bitte geben Sie den Telefonnummer des Fahrers ein um dich zu Registrieren: ");
    int driverCode = int.tryParse(stdin.readLineSync()!) ?? 0;
    print(
        "Bitte geben Sie den CompanyCode des Fahrers ein um dich zu Registrieren: ");
    int driverCompany = int.tryParse(stdin.readLineSync()!) ?? 0;

    print(
        "Bitte geben Sie das Passwort des Fahrers ein um dich zu Registrieren: ");
    String driverPassword = stdin.readLineSync()!;
    print(
        "Bitte wiederholen Sie das Passwort des Fahrers ein um dich zu Registrieren: ");
    String driverPassword1 = stdin.readLineSync()!;

    if (isStrongPassword(driverPassword) && driverPassword1 == driverPassword) {
      Driver newDriver =
          Driver(driverName, driverCompany, driverCode, driverPassword);
      databaseRepository.addUser(newDriver);
    } else {
      print(
          "Das Passwort entspricht nicht den Anforderungen. Bitte geben Sie das Passwort erneut ein.");
      String driverPassword = stdin.readLineSync()!;
      driverRegistri();
    }
  }

  bool isDriverLogin(DatabaseRepository databaseRepository) {
    print("Bitte geben Sie Ihren Fahrer code ein um dich einzuloggen: ");
    String driverCode = stdin.readLineSync()!;

    print("Bitte geben Sie Ihr Passwort ein: ");
    String driverPassword = stdin.readLineSync()!;

    Driver? foundDriver = databaseRepository.findDriverByName(driverCode);

    if (foundDriver != null && foundDriver.password == driverPassword) {
      print("Anmeldung erfolgreich! Willkommen, ${foundDriver.name}.");
      return true;
    } else {
      print(
          "Anmeldung fehlgeschlagen. Bitte überprüfen Sie Ihre Anmeldedaten.");
      return false;
    }
  }

  bool isUserLogin(DatabaseRepository databaseRepository) {
    print("Bitte geben Sie Ihren Benutzernamen ein um dich einzuloggen: ");
    String userName = stdin.readLineSync()!;

    print("Bitte geben Sie Ihr Passwort ein um dich einzuloggen: ");
    String userPassword = stdin.readLineSync()!;

    User? foundUser = databaseRepository.findUserByName(userName);

    if (foundUser != null && foundUser.password == userPassword) {
      print("Anmeldung erfolgreich! Willkommen, ${foundUser.name}.");
      return true;
    } else {
      print(
          "Anmeldung fehlgeschlagen. Bitte überprüfen Sie Ihre Anmeldedaten.");
      return false;
    }
  }

  void addUserRating(User user, int rating) {}
  void addDriverRating(Driver driver, int rating) {}
}
