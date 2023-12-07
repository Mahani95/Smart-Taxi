import 'package:p11/class/user.dart';
import 'package:p11/data/DatabaseRepository.dart';

class Driver extends User {
  int? companyCode;

  Driver(super.name, this.companyCode, super.code, super.password);

  void updateCompanyCode(int newCompanyCode) {
    // Methode, um den Firmencode eines Fahrers zu aktualisieren
    companyCode = newCompanyCode;
    print("Der Firmencode wurde erfolgreich aktualisiert.");
  }

  void printDriverInfo() {
    // Methode, um Fahrerinformationen auszugeben
    print(
        "Fahrerinfo - Benuername:$name Company Code: $companyCode, Code: $code, Passwort: $password");
  }

  bool isVerifiDriver(int companyCode, int code, String password) {
    DatabaseRepository databaseRepository = DatabaseRepository();

    List<Driver> drivers = databaseRepository.getDrivers();

    for (Driver driver in drivers) {
      if ((driver.code == code && driver.companyCode == companyCode) &&
          driver.password == password) {
        return true;
      }
    }

    return false;
  }

  void addDriverRating(Driver driver, int rating) {}
}
