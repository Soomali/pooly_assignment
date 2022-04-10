part of 'sign_up.dart';

class SignUpPhotoArea extends StatelessWidget {
  const SignUpPhotoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uint8List? photo = context.read<SignupBloc>().state.photo;
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * 0.3,
          height: size.height * 0.1,
          decoration: ShapeDecoration(
              shape: CircleBorder(side: BorderSide(width: 1.6)),
              color: Colors.blue.shade200,
              image: photo == null
                  ? null
                  : DecorationImage(image: MemoryImage(photo))),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
              onPressed: () {
                context.read<SignupBloc>().add(PhotoSelect());
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                size: 36,
              )),
        )
      ],
    );
  }
}
