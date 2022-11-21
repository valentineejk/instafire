import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image = await _imagePicker.pickImage(source: source);

  if (_image != null) {
    return await _image.readAsBytes();
  }
  print("No image selected");
}
