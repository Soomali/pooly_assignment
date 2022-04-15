part of 'entities.dart';

class Passenger extends User {
  Passenger(
      {required DocumentReference<Object?> id,
      required String name,
      required String surname,
      required int age,
      required String? photoUrl,
      required String department,
      required String university})
      : super(
            id: id,
            name: name,
            surname: surname,
            age: age,
            photoUrl: photoUrl,
            department: department,
            university: university);

  static final List<Passenger> _passengers = [
    Passenger(
        id: _randomId,
        name: 'Kevin',
        surname: 'Durant',
        age: 19,
        photoUrl: 'kevin.png',
        department: 'Endüstri Mühendisliği',
        university: 'Boğaziçi Üniversitesi'),
    Passenger(
        id: _randomId,
        name: 'Lebron',
        surname: 'James',
        age: 20,
        photoUrl: 'lebron.png',
        department: 'Hukuk',
        university: 'Koç Üniversitesi'),
    Passenger(
        id: _randomId,
        name: 'Micheal',
        surname: 'Jordan',
        age: 23,
        photoUrl: 'micheal.png',
        department: 'Ekonomi',
        university: 'Sabancı Üniversitesi'),
    Passenger(
        id: _randomId,
        name: 'Stephen',
        surname: 'Curry',
        age: 20,
        photoUrl: 'stephen.png',
        department: 'Diş Hekimliği ',
        university: 'Yeditepe Üniversitesi'),
    Passenger(
        id: _randomId,
        name: 'Kyrie',
        surname: 'Irving',
        age: 19,
        photoUrl: 'kyrie.png',
        department: 'Psikoloji Mühendisliği',
        university: 'Özyeğin Üniversitesi')
  ];
  factory Passenger.random() {
    return _passengers[_random.nextInt(_passengers.length)];
  }
  Map<String, dynamic> get map {
    return {
      'name': name,
      'surname': surname,
      'age': age,
      'photoUrl': photoUrl,
      'department': department,
      'university': university
    };
  }
}
