import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/map/map_bloc.dart';
import '../../repos/map/map_repo.dart';

part 'drive_details.dart';
part 'drive_container.dart';
part 'drive_area.dart';
part 'map_container.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MapRepository(),
      child: BlocProvider(
        create: (context) => MapBloc(),
        child: const SafeArea(
          child: MapContainer(),
        ),
      ),
    );
  }
}
