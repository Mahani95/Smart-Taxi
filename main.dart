import 'package:p11/data/DatabaseRepository.dart';

void main() {
  DatabaseRepository databaseRepository = DatabaseRepository();

  databaseRepository.driverRegistri();
  databaseRepository.isUserLogin;

  databaseRepository.userRegistri();
  databaseRepository.isDriverLogin;
/*
  TaxiService taxiService = TaxiService();
  print("Willkommen beim Taxi-Service!");

  print("Möchten Sie ein Fahrzeug auswählen? (Ja/Nein)");
  String? selectVehicle = stdin.readLineSync();

  if (selectVehicle?.toLowerCase() == 'ja') {
    taxiService.selectVehicle();
  }
  print("Möchten Sie einen Fahrer auswählen? (Ja/Nein)");
  String? selectDriver = stdin.readLineSync();
  if (selectDriver?.toLowerCase() == "ja") {
    taxiService.selectDriver();
  }
  taxiService.orderTaxi();*/
}
