part of 'entities.dart';

class Route {
  final Destination start;
  final Destination stop;
  final double? distanceMeters;
  final Duration? duration;
  final DateTime startTime;
  final List<Drive> drives;

  Route(this.start, this.stop, this.startTime,
      {this.distanceMeters, this.duration, required this.drives});
  Route copyWith(
      {Destination? start,
      Destination? stop,
      DateTime? startTime,
      double? distanceMeters,
      Duration? duration,
      List<Drive>? drives}) {
    return Route(
        start ?? this.start, stop ?? this.stop, startTime ?? this.startTime,
        distanceMeters: distanceMeters ?? this.distanceMeters,
        duration: duration ?? this.duration,
        drives: drives ?? this.drives);
  }
}
