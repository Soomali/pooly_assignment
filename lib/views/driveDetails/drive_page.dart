part of 'drive_details.dart';

class DrivePage extends StatelessWidget {
  final Drive drive;
  const DrivePage({Key? key, required this.drive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const seperator = SizedBox(
      height: 24,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/${drive.driver.photoUrl!}'),
            radius: 128,
          ),
          seperator,
          Text(
            'Arabayı ${drive.driver.name} ${drive.driver.surname} Sürüyor.',
            style: Theme.of(context).textTheme.headline5,
          ),
          seperator,
          Text(
            'Şu anda ${drive.passengers.length} kişi bu yolculuğa katılıyor.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Bu yolculuk ${DateFormat("dd MMM HH:mm").format(drive.startTime)} tarihinde gerçekleşecek',
            textAlign: TextAlign.center,
          ),
          seperator,
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ...List.generate(
                    4,
                    (index) => DrivePriceData(
                          passengerCount: index + 1,
                          price: drive.price / (index + 1),
                          seperator: SizedBox(
                              width: MediaQuery.of(context).size.width * .4),
                        )),
              ],
            ),
          ),
          seperator,
          seperator,
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide()),
              ),
              onPressed: () {
                log('reserve');
              },
              child: Text(
                ' Bu yolculuğa katıl (${(drive.price / (drive.passengers.length + 1)).toStringAsFixed(2)}TL) ',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ))
        ],
      ),
    );
  }
}
