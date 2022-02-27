import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Cards/KameraSablon.dart';
import 'package:whatsapp_clone/Screens/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); /*Main fonksiyonunu asenkron yapmak istediğimde kullanıyodum.runApp'ten hemen önce gelmeli */

  kameralar =
      await availableCameras(); /*kameralar değişkeni kameraşablon classımdan geldi.Ona atadığım fonksiyonsa camera.dart tarafından sağlanıyor */

  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "OpenSans",
            primaryColor: Color(0xFF075E54),
            accentColor: Color(0xFF128C7E)),
        home: HomeScreen());
  }
}
