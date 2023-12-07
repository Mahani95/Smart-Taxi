import 'package:p11/class/driver.dart';
import 'package:p11/class/user.dart';
import 'package:p11/data/DatabaseRepository.dart';

class Rating extends Driver {
  List<Driver>? drivers;
  List<User>? users;
  final int rating;

  Rating(
      this.rating, super.name, super.companyCode, super.code, super.password);
}

DatabaseRepository databaseRepository = DatabaseRepository();

double calculateAverageRating(List<Rating> ratings) {
  if (ratings.isEmpty) {
    return 0.0;
  }
  double totalRating =
      ratings.map((rating) => rating.rating).reduce((a, b) => a + b).toDouble();
  return totalRating / ratings.length;
}

void rateUserProduct(User user, int rating) {
  user.addUserRating(user, rating);
  print("Vielen Dank für Ihre Bewertung.");
}

void rateDriverProduct(Driver driver, int rating) {
  driver.addDriverRating(driver, rating);
  print("Vielen Dank für Ihre Bewertung.");
}
