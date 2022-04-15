import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:pooly_test/repos/search/search_repo.dart';
import '../../bloc/map/map_bloc.dart';
import '../../entities/entities.dart';
import '../../bloc/search/search_bloc.dart';

part 'search_input.dart';
part 'search_layout.dart';
part 'search_result_item.dart';
part 'search_result_list.dart';
part 'search_input_container.dart';
part 'search_input_display.dart';
part 'search_locations.dart';
part 'search_result_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchRepository = SearchRepository();
    return RepositoryProvider.value(
      value: searchRepository,
      child: BlocProvider(
        create: (context) => SearchBloc(searchRepository),
        child: SearchLayout(),
      ),
    );
  }
}
