part of 'entities.dart';

class Route {
  final Destination start;
  final Destination stop;
  final int distanceMeters;
  final Duration duration;

  Route(this.start, this.stop, this.distanceMeters, this.duration);
  Route copyWith(
      {Destination? start,
      Destination? stop,
      int? distanceMeters,
      Duration? duration}) {
    return Route(start ?? this.start, stop ?? this.stop,
        distanceMeters ?? this.distanceMeters, duration ?? this.duration);
  }
}
