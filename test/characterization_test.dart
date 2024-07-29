import 'package:car_rental_billing/customer.dart';
import 'package:car_rental_billing/rental.dart';
import 'package:car_rental_billing/vehicle.dart';
import 'package:test/test.dart';

void main() {
  group('The Statement should:', () {
    test('Match current behavior', () {
      var blueHonda = Sedan("Blue Honda 2008");
      var greyJeep = FourByFour("Grey Jeep 2013");
      var RedSunny = Sedan("Red Sunny 2014");
      var BlueBMW = SUV("Blue X3 2017");

      var hondaRental = Rental(blueHonda, 431, 4, false);
      var jeepRental = Rental(greyJeep, 744, 4, false);
      var sunnnyRental = Rental(RedSunny, 591, 3, true);
      var x3Rental = Rental(BlueBMW, 240, 5, false);

      var ynmo = Customer("Ynmo");
      var softcare = Customer("Soft Care");

      ynmo.addRental(hondaRental);
      ynmo.addRental(jeepRental);
      ynmo.addRental(sunnnyRental);

      softcare.addRental(x3Rental);

      expect(ynmo.statement(),
          "Rental Record for:Ynmo\n\t\"Blue Honda 2008\"\tLE 912.00\n\t\"Grey Jeep 2013\"\tLE 850.00\n\t\"Red Sunny 2014\"\tLE 1268.96\nAmount owed is LE 3030.96\nYou earned: 4 new Reward Points\n\n");
      expect(softcare.statement(),
          "Rental Record for:Soft Care\n\t\"Blue X3 2017\"\tLE 760.00\nAmount owed is LE 760.00\nYou earned: 1 new Reward Points\n\n");
    });
  });
}
