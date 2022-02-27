import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/Screens/FotoOnay.dart';
import 'package:whatsapp_clone/Screens/VideoOnay.dart';

List<CameraDescription> kameralar;

class KameraSablon extends StatefulWidget {
  const KameraSablon({Key key}) : super(key: key);

  @override
  _KameraSablonState createState() => _KameraSablonState();
}

class _KameraSablonState extends State<KameraSablon> {
  CameraController _cameraController;
  Future<void> cameraValue;
  bool isRecording = false;
  bool isFlashOpen = false;
  bool isCameraFlip = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(kameralar[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

/*build metodunun dışında context gerekirse alttaki gibi parametre olarak alıyoruz. */
  void takePhoto(BuildContext context) async {
    /*final path = join((await getTemporaryDirectory()).path,
        "${DateTime.now()}.png");*/
    /*Android cihazındaki temp klasörünün yolunu alıyoruz.Bunu da path provider paketi sayesinde sağlıyoruz.Join methodu da path paketiyle geliyor.*/
    XFile path = await _cameraController
        .takePicture(); /*Yeni versiyonda otomatik path oluşturuyo yukardaki koda gerek yok */
    Navigator.push(context,
        MaterialPageRoute(builder: (builder) => FotoOnay(path: path.path)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*Kamera plugini için future builder kullanacağız */
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(3),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          isFlashOpen ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            isFlashOpen = !isFlashOpen;
                          });
                          isFlashOpen
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        child: isRecording
                            ? Icon(Icons.radio_button_on,
                                color: Colors.red, size: 80)
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 80,
                              ),
                        onTap: () {
                          if (!isRecording) takePhoto(context);
                        },
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videoPath =
                              await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoOnay(
                                        path: videoPath.path,
                                      )));
                        },
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () async {
                          int cameraPos = isCameraFlip ? 1 : 0;
                          _cameraController = CameraController(
                              kameralar[cameraPos], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                          setState(() {
                            isCameraFlip = !isCameraFlip;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "Video için basılı tutun,fotoğraf için dokunun",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
