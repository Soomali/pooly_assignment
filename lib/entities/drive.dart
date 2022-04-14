part of 'entities.dart';

class Drive {
  final List<Passenger> passengers;
  final Driver driver;
  final int price;
  Drive(this.passengers, this.driver, this.price);

  factory Drive.random(int price) {
    return Drive(
        List.generate(_random.nextInt(4), (index) => Passenger.random()),
        Driver.random(),
        price);
  }
}
