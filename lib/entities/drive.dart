part of 'entities.dart';

class Drive {
  final Route route;
  final List<Passenger> passengers;
  final Driver driver;
  final int price;
  final DateTime startTime;
  Drive(this.route, this.passengers, this.driver, this.price, this.startTime);

  factory Drive.fromRoute(Route route, int price, DateTime startTime) {
    return Drive(
        route,
        List.generate(_random.nextInt(4), (index) => Passenger.random()),
        Driver.random(),
        price,
        startTime);
  }
}
