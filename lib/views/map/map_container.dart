part of 'map_page.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kKocKuzeyKampus = CameraPosition(
    target: LatLng(38.1944464875642, 29.048807655503655),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(
        buildWhen: (previous, current) =>
            current is MapRouteSelected || current is MapDriveSelected,
        builder: (context, state) {
          late final CameraPosition position;
          late final List<LatLng> polyLines;
          late final Set<Marker> markers;
          if (state is MapRouteSelected) {
            polyLines = state.polyLineCoordinates;
            final drive =
                state.route.drives.isNotEmpty ? state.route.drives.first : null;
            position =
                drive != null ? getCameraPosition(drive) : _kKocKuzeyKampus;
            if (drive != null) {
              markers = {
                Marker(
                    markerId: MarkerId('start'),
                    position:
                        LatLng(drive.start.latitude, drive.start.longitude)),
                Marker(
                    markerId: MarkerId('stop'),
                    position:
                        LatLng(drive.stop.latitude, drive.stop.longitude)),
              };
            }
          } else if (state is MapDriveSelected) {
            polyLines = state.polyLineCoordinates;
            position = getCameraPosition(state.drive);
            markers = {
              Marker(
                  markerId: MarkerId('start'),
                  position: LatLng(
                      state.drive.start.latitude, state.drive.start.longitude)),
              Marker(
                  markerId: MarkerId('stop'),
                  position: LatLng(
                      state.drive.stop.latitude, state.drive.stop.longitude)),
            };
          }
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .82,
                child: Stack(
                  children: [
                    GoogleMap(
                      markers: markers,
                      polylines: createPolylines(polyLines),
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: position,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      left: 20,
                      child: Column(
                        children: [
                          SearchInputDisplay(
                              text: (state as MapDataState)
                                  .route
                                  .start
                                  .description!,
                              onTap: () {
                                context
                                    .read<MapBloc>()
                                    .add(SearchRequestEvent(state.route));
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          SearchInputDisplay(
                              text: (state).route.stop.description!,
                              onTap: () {
                                context
                                    .read<MapBloc>()
                                    .add(SearchRequestEvent(state.route));
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (state is MapDataState)
                DriveContainer(
                  drives: state.route.drives,
                  state: state,
                )
            ],
          );
        },
      ),
    );
  }

  CameraPosition getCameraPosition(Drive drive) {
    final distance = MapRepository.calculateDistanceAsKilometers(
        drive.start.latitude,
        drive.start.longitude,
        drive.stop.latitude,
        drive.stop.longitude);
    final zoom = distance * .8;
    log('distance is:$distance');
    log('zoom is: $zoom');
    return CameraPosition(
        target: LatLng((drive.start.latitude + drive.stop.latitude) * 0.5,
            (drive.start.longitude + drive.stop.longitude) * 0.5),
        zoom: zoom);
  }

  Set<Polyline> createPolylines(List<LatLng> polyLinePoints) {
    return {
      Polyline(
          polylineId: PolylineId(
              '${polyLinePoints.first.latitude}_${polyLinePoints.last.latitude}'),
          points: polyLinePoints,
          color: Colors.red.shade600,
          width: 8)
    };
  }
}
