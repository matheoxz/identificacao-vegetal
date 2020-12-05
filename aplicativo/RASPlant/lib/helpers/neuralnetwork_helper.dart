import 'package:tflite/tflite.dart';

class Identificador {
  String res;

  dynamic load() async {
    try {
      res = await Tflite.loadModel(model: "assets/model.tflite");
    } catch (e) {
      return e;
    }
    return 1;
  }

  void end() async {
    await Tflite.close();
  }

  dynamic recognize(String imgPath) async {
    var recognitions = await Tflite.runModelOnImage(path: imgPath);
    return recognitions;
  }
}
