import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pooly_test/views/map/map_page.dart';
import 'package:pooly_test/views/search/search_page.dart';
import '../../entities/entities.dart';
part 'drive_page.dart';

class DriveDetails extends StatelessWidget {
  final Drive drive;
  const DriveDetails({Key? key, required this.drive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
            tag: 'drive',
            child: DrivePage(
              drive: drive,
            )),
      ),
    );
  }
}
