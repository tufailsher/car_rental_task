
import 'package:car_rental_billing/vehicle_types.dart';

abstract class Vehicle {
  String get makeAndModel;
  int get rateCode;
  
  num calculateRentalCost(num daysRented, num kilometersRented, bool isLate);
  num calculateRewardPoints(num daysRented);
}
class Sedan implements Vehicle {
  @override
  final String makeAndModel;
  @override
  final int rateCode = VehicleTypes.SEDAN;

  Sedan(this.makeAndModel);

  @override
  num calculateRentalCost(num daysRented, num kilometersRented, bool isLate) {
    num amount = 50.0; // Setup fee
    amount += 100 * daysRented;
    if (kilometersRented > daysRented * 50) {
      amount += (kilometersRented - daysRented * 50) * 2;
    }
    if (isLate) {
      amount += amount * 0.03;
    }
    return amount;
  }

  @override
  num calculateRewardPoints(num daysRented) {
    return 1;
  }
}

class FourByFour implements Vehicle {
  @override
  final String makeAndModel;
  @override
  final int rateCode = VehicleTypes.FOURxFOUR;

  FourByFour(this.makeAndModel);

  @override
  num calculateRentalCost(num daysRented, num kilometersRented, bool isLate) {
    num amount = 50.0; // Setup fee
    amount += 200 * daysRented;
    if (kilometersRented >= 200 && daysRented > 10) {
      amount -= amount * 0.05;
    }
    if (isLate) {
      amount += amount * 0.03;
    }
    return amount;
  }

  @override
  num calculateRewardPoints(num daysRented) {
    return 2;
  }
}

class SUV implements Vehicle {
  @override
  final String makeAndModel;
  @override
  final int rateCode = VehicleTypes.SUV;

  SUV(this.makeAndModel);

  @override
  num calculateRentalCost(num daysRented, num kilometersRented, bool isLate) {
    num amount = 50.0; // Setup fee
    amount += 150 * daysRented;
    if (kilometersRented > daysRented * 70) {
      amount += (kilometersRented - daysRented * 70) * 2;
    }
    if (kilometersRented >= 200) {
      amount -= amount * 0.05;
    }
    if (isLate) {
      amount += amount * 0.03;
    }
    return amount;
  }

  @override
  num calculateRewardPoints(num daysRented) {
    return 1 + (daysRented > 5 ? daysRented - 5 : 0);
  }
}