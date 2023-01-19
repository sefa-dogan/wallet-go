import 'package:camera/camera.dart';

// ignore: prefer_typing_uninitialized_variables
var cameras;
getAvaibleCameras() async {
  cameras = await availableCameras();
}
