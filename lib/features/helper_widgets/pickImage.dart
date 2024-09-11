import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage()async{
  final ImagePicker imagePicker = ImagePicker();

  final returnedImage=   await imagePicker.pickImage(source:ImageSource.gallery);
  // setState(() {
  //   // selectedImage= File(returnedImage!.path);
  //   event.image= File(returnedImage!.path);
  //
  // });
  return null;

}
