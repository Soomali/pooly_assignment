import 'dart:async';

import 'package:image_picker/image_picker.dart';

class SignUpRepository {
  final ImagePicker _picker = ImagePicker();
  final StreamController<XFile?> _imageStream = StreamController();
  Stream<XFile?> get imageStream => _imageStream.stream;
  Future<void> getImage(ImageSource source) async {
    _picker.pickImage(source: source).then((value) => _imageStream.add(value));
  }
}
