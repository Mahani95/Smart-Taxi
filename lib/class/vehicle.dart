import 'package:p11/class/driver.dart';
import 'package:p11/class/taxi_order.dart';

class Vehicle {
  TaxiType type;
  Driver driver;
  String model;
  int seating;

  Vehicle(this.type, this.driver, this.model, this.seating);
}
