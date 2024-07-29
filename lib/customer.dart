
import 'package:car_rental_billing/rental.dart';

class Customer {
  final String _name;
  final List<Rental> _rentals;

  Customer(this._name) : _rentals = [];

  void addRental(Rental rental) {
    _rentals.add(rental);
  }

  String getName() => _name;

  String statement() {
    num totalAmount = 0.0;
    num rewardPoints = 0.0;
    var result = "Rental Record for:${getName()}\n";

    for (var rental in _rentals) {
      num thisAmount = rental.calculateCost();
      rewardPoints += rental.calculateRewardPoints();

      result += "\t\"${rental.vehicle.makeAndModel}\"\tLE ${thisAmount.toStringAsFixed(2)}\n";
      totalAmount += thisAmount;
    }

    result += "Amount owed is LE ${totalAmount.toStringAsFixed(2)}\n";
    result += "You earned: ${rewardPoints.toStringAsFixed(rewardPoints.truncateToDouble() == rewardPoints ? 0 : 1)} new Reward Points\n\n";

    return result;
  }
}
