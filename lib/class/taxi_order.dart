import 'dart:io';
import 'package:p11/class/vehicle.dart';
import 'package:p11/data/DatabaseRepository.dart';

enum TaxiType { standard, luxus, electro }

class TaxiService {
  List<Vehicle> selectedDriver = [];

  //Vehicle? selectedVehicles;
  //List<Driver>? selectedDrivers;

  void selectVehicle() {
    DatabaseRepository repository = DatabaseRepository();
    print("Verfügbare Fahrzeuge:");
    print("1. Standard-Taxi");
    print("2. Luxus-Taxi");
    print("3. Electro-Taxi");

    switch (stdin.readLineSync()) {
      case "1":
        List<Vehicle> vehicles = repository.getVehicles();
        for (var i in vehicles) {
          if (i.type == TaxiType.standard) {
            selectedDriver.add(i);
          }
        }
        print("sie haben ein Standard-Taxi gewählt");

        selectDriver();
      case "2":
        List<Vehicle> vehicles = repository.getVehicles();
        for (var i in vehicles) {
          if (i.type == TaxiType.luxus) {
            selectedDriver.add(i);
          }
        }
        print("Sie haben ein Luxus-Taxi gewählt");
        selectDriver();
      case "3":
        List<Vehicle> vehicles = repository.getVehicles();
        for (var i in vehicles) {
          if (i.type == TaxiType.electro) {
            selectedDriver.add(i);
          }
        }
        print("Sie haben ein Electro-Taxi gewählt");
        selectDriver();
      case "":
        print("Es wurde kein Fahrzeug ausgewählt.");
        orderTaxiFail();
    }
  }

  void selectDriver() {
    print("Verfügbare Fahrer:");
    for (var i = 0; i < selectedDriver.length; i++) {
      print("${i + 1}. ${selectedDriver[i].driver.name}");
    }

    String selection = stdin.readLineSync().toString();

    int currentSelectionAsInt = int.parse(selection);

    Vehicle currentVehicle = selectedDriver[currentSelectionAsInt - 1];

    orderTaxi(currentVehicle);
  }

  void orderTaxi(Vehicle vehicle) {
    print("Vielen Dank für Ihre Bestellung!");
    print(
        "Ihr Taxi ${vehicle.type} mit ${vehicle.driver.name} wird in Kürze eintreffen.");
  }

  void orderTaxiFail() {
    print("Vielen Dank für Ihre Bestellung!");
    print(
        "Die Bestellung ist abgeschlossen. in Kürze trifft ein Taxi bei ihnen ein.");
  }
}
