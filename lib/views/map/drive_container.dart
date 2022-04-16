part of 'map_page.dart';

class DriveContainer extends StatelessWidget {
  final List<Drive> drives;
  final MapDataState state;
  const DriveContainer({Key? key, required this.drives, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        child: ListView.separated(
            separatorBuilder: ((context, index) {
              return SizedBox(
                width: 12,
              );
            }),
            scrollDirection: Axis.horizontal,
            itemCount: drives.length,
            itemBuilder: (context, index) {
              final drive = drives[index];
              return DriveWidget(
                drive: drive,
                isSelected: drive == state.drive,
              );
            }),
      ),
    );
  }
}
