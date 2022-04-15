import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pooly_test/repos/user/user_repository.dart';
import '../../bloc/map/map_bloc.dart';
import '../../repos/map/map_repo.dart';
import 'dart:async';

part 'drive_details.dart';
part 'drive_container.dart';
part 'drive_area.dart';
part 'map_container.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = MapRepository(RepositoryProvider.of<UserRepository>(context));
    return RepositoryProvider(
      create: (context) => repo,
      child: BlocProvider(
        create: (context) => MapBloc(repo),
        child: const SafeArea(
          child: MapContainer(),
        ),
      ),
    );
  }
}
