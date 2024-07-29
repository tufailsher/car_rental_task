import 'package:car_rental_billing/vehicle.dart';

abstract class IRental {
  Vehicle get vehicle;
  num get kilometersRented;
  num get daysRented;
  bool get isLate;
}

class Rental implements IRental {
  @override
  final Vehicle vehicle;
  @override
  final num kilometersRented;
  @override
  final num daysRented;
  @override
  final bool isLate;

  Rental(this.vehicle, this.kilometersRented, this.daysRented, this.isLate);

  num calculateCost() {
    return vehicle.calculateRentalCost(daysRented, kilometersRented, isLate);
  }

  num calculateRewardPoints() {
    return vehicle.calculateRewardPoints(daysRented);
  }
}
