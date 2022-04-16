import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pooly_test/repos/user/user_repository.dart';
import 'package:pooly_test/views/driveDetails/drive_details.dart';
import 'package:pooly_test/views/search/search_page.dart';
import '../../bloc/map/map_bloc.dart';
import '../../entities/entities.dart';
import '../../repos/map/map_repo.dart';
import 'dart:async';
import '../../entities/entities.dart' as ent;
part 'drive_details.dart';
part 'drive_container.dart';
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
        child: SafeArea(
          child: BlocConsumer<MapBloc, MapState>(
            listener: (context, state) {
              if (state is MapDriveConfirmed) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DriveDetails(drive: state.drive)));
              }
            },
            buildWhen: ((previous, current) =>
                !(previous is MapInitial && current is SearchRequested)),
            builder: (context, state) {
              log('mapStateRunTimeType: ${state.runtimeType}');
              log('drives if any: ${state is MapRouteSelected ? state.route.drives.length : "yok"}');
              if (state is MapInitial) {
                return SearchPage();
              } else if (state is SearchRequested) {
                return SearchPage(route: state.route);
              } else if (state is MapFetchingRoute) {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
              return MapContainer();
            },
          ),
        ),
      ),
    );
  }
}
