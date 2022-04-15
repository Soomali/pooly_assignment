part of 'entities.dart';

class Driver extends User {
  final String car;
  Driver(
      {required DocumentReference<Object?> id,
      required String name,
      required String surname,
      required int age,
      required String? photoUrl,
      required String department,
      required String university,
      required this.car})
      : super(
            id: id,
            name: name,
            surname: surname,
            age: age,
            photoUrl: photoUrl,
            department: department,
            university: university);

  static final List<Driver> _driver = [
    Driver(
        id: _randomId,
        name: 'Kevin',
        surname: 'Durant',
        age: 19,
        photoUrl: 'kevin.png',
        department: 'Endüstri Mühendisliği',
        university: 'Boğaziçi Üniversitesi',
        car: 'Porsche'),
    Driver(
        id: _randomId,
        name: 'Lebron',
        surname: 'James',
        age: 20,
        photoUrl: 'lebron.png',
        department: 'Hukuk',
        university: 'Koç Üniversitesi',
        car: 'Lamborghini'),
    Driver(
        id: _randomId,
        name: 'Micheal',
        surname: 'Jordan',
        age: 23,
        photoUrl: 'micheal.png',
        department: 'Ekonomi',
        university: 'Sabancı Üniversitesi',
        car: 'Sedan'),
    Driver(
        id: _randomId,
        name: 'Stephen',
        surname: 'Curry',
        age: 20,
        photoUrl: 'stephen.png',
        department: 'Diş Hekimliği ',
        university: 'Yeditepe Üniversitesi',
        car: 'Fiat'),
    Driver(
        id: _randomId,
        name: 'Kyrie',
        surname: 'Irving',
        age: 19,
        photoUrl: 'kyrie.png',
        department: 'Psikoloji Mühendisliği',
        university: 'Özyeğin Üniversitesi',
        car: 'Fiat')
  ];

  factory Driver.random() {
    return _driver[_random.nextInt(_driver.length)];
  }
}
