part of 'sign_up.dart';

class SignUpPhotoArea extends StatelessWidget {
  const SignUpPhotoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: ((previous, current) => current is PhotoChangedState),
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.15,
              decoration: ShapeDecoration(
                  shape: CircleBorder(side: BorderSide(width: 1.6)),
                  color: Colors.blue.shade200,
                  image: state.photo == null
                      ? null
                      : DecorationImage(
                          fit: BoxFit.cover, image: MemoryImage(state.photo!))),
            ),
            Positioned(
              right: -2,
              bottom: -2,
              child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              context
                                  .read<SignupBloc>()
                                  .add(PhotoSelect(source: ImageSource.camera));
                            },
                            child: Text('Kamera')),
                        TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              context.read<SignupBloc>().add(
                                  PhotoSelect(source: ImageSource.gallery));
                            },
                            child: Text('Galeri'))
                      ],
                    )));
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    size: 36,
                  )),
            )
          ],
        );
      },
    );
  }
}
