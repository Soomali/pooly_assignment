part of 'entities.dart';

class Drive {
  final List<Passenger> passengers;
  final Driver driver;
  final DateTime startTime;
  final GeoFirePoint start;
  final GeoFirePoint stop;
  final int price;
  final List<LatLng> polyLineCoordinates;
  Drive(this.passengers, this.driver, this.price, this.startTime, this.start,
      this.stop, this.polyLineCoordinates);

  factory Drive.random(int price, GeoFirePoint start, GeoFirePoint stop) {
    return Drive(
        List.generate(_random.nextInt(4), (index) => Passenger.random()),
        Driver.random(),
        price,
        DateTime.now(),
        start,
        stop, []);
  }

  static final drives = <Drive>[
    Drive(
        [],
        Driver._driver[1],
        26,
        DateTime.parse('2022-04-17 19:00'),
        GeoFirePoint(41.1944464875642, 29.048807655503655),
        GeoFirePoint(41.066475347332215, 29.012716619055617),
        []),
    Drive(
        [],
        Driver._driver[0],
        10,
        DateTime.parse('2022-04-17 18:00'),
        GeoFirePoint(41.08588217761171, 29.045288574037315),
        GeoFirePoint(41.041206460777744, 29.007336968493245),
        []),
    Drive(
        [],
        Driver._driver[2],
        55,
        DateTime.parse('2022-04-17 20:30'),
        GeoFirePoint(40.89267467918472, 29.377324985677237),
        GeoFirePoint(40.992812363933055, 29.023183395388077),
        []),
    Drive(
        [],
        Driver._driver[3],
        22,
        DateTime.parse('2022-04-17 21:00'),
        GeoFirePoint(40.972724395444324, 29.15235747828988),
        GeoFirePoint(41.0232885450831, 29.044176353151244),
        []),
    Drive(
        [],
        Driver._driver[4],
        37,
        DateTime.parse('2022-04-17 18:30'),
        GeoFirePoint(41.02948480175818, 29.259191053151547),
        GeoFirePoint(40.99293695958503, 29.104753081985603),
        []),
  ];

  Map<String, dynamic> get map {
    return {
      'passengers': passengers.map((e) => e.id).toList(),
      'driver': driver.id,
      'price': price,
      'startTime': startTime,
      'start': start.data,
      'stop': stop.data,
    };
  }
}
