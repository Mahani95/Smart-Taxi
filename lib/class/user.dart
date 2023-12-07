import 'dart:io';

import 'package:p11/data/DatabaseRepository.dart';

class User extends DatabaseRepository {
  String name;
  int? code;
  String? password;

  User(this.name, this.code, this.password);

  get id => null;

  void changePassword(String newPassword) {
    // Methode, um das Passwort eines Benutzers zu ändern
    this.password = newPassword;
    print("Das Passwort wurde erfolgreich geändert.");
  }

  void changeName(String newName) {
    // Methode, um das Passwort eines Benutzers zu ändern
    newName = this.name;
    print("Der Name wurde erfolgreich geändert in $newName.");
  }

  void printUserInfo() {
    // Methode, um Benutzerinformationen auszugeben
    print("Benutzerinfo - Benutername:$name Code: $code, Passwort: $password");
  }

  bool isStrongPassword(String userPassword) {
    if (userPassword.length < 8) {
      return false;
    }
    if (!userPassword.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!userPassword.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!userPassword.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  @override
  bool isLogin(DatabaseRepository databaseRepository) {
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

  bool isVerifiUser(int code, String password) {
    DatabaseRepository databaseRepository = DatabaseRepository();

    List<User> users = databaseRepository.getDrivers();

    for (User driver in users) {
      if (driver.code == code && driver.password == password) {
        return true;
      }
    }
    return false;
  }
}
