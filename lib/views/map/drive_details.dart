part of 'map_page.dart';

class DriveWidget extends StatelessWidget {
  final Drive drive;
  final bool isSelected;
  const DriveWidget({Key? key, required this.drive, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Sürücü: ${drive.driver.name} ${drive.driver.surname}'),
        DrivePriceData(
          passengerCount: drive.passengers.length,
          price: drive.price / (drive.passengers.length + 1),
        ),
        Text('${DateFormat('dd MMM HH:mm ').format(drive.startTime)}'),
      ],
    );
    return GestureDetector(
      onTap: () {
        final bloc = context.read<MapBloc>();
        final state = bloc.state as MapDataState;
        bloc.add(isSelected
            ? DriveConfirmedEvent(drive, state.route)
            : DriveSelectedEvent(drive, state.route));
      },
      child: Card(
        color: isSelected ? Theme.of(context).colorScheme.onSurface : null,
        elevation: 1.6,
        child: IconTheme(
          data: IconThemeData(
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary),
          child: DefaultTextStyle(
            style: isSelected
                ? TextStyle(color: Theme.of(context).colorScheme.secondary)
                : TextStyle(color: Theme.of(context).colorScheme.primary),
            child: context.watch<MapBloc>().state is MapDriveConfirmed
                ? Hero(
                    tag: 'driveSelected',
                    child: child,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}

class DrivePriceData extends StatelessWidget {
  final Widget? seperator;
  const DrivePriceData(
      {Key? key,
      required this.price,
      required this.passengerCount,
      this.seperator})
      : super(key: key);
  final double price;
  final int passengerCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person),
            Text('$passengerCount'),
          ],
        ),
        seperator ?? SizedBox(width: MediaQuery.of(context).size.width * 0.06),
        Row(
          children: [
            Text(price.toStringAsFixed(2)),
            Icon(Icons.attach_money),
          ],
        )
      ],
    );
  }
}
