import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/KameraAnaSayfa.dart';
import 'package:whatsapp_clone/Pages/Sohbetler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    ); /*initial index sayesinde sayfa yüklenirken hangi tabın yükleneceğini seçebiliyoruz. */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text("Whatsappp"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Yeni grup"),
                value: "Yeni grup",
              ),
              PopupMenuItem(
                child: Text("Yeni toplu mesaj"),
                value: "Yeni toplu mesaj",
              ),
              PopupMenuItem(
                child: Text("Bağlı cihazlar"),
                value: "Bağlı Cihazlar",
              ),
              PopupMenuItem(
                child: Text("Yıldızlı mesajlar"),
                value: "Yıldızlı mesajlar",
              ),
              PopupMenuItem(
                child: Text("Ayarlar"),
                value: "Ayarlar",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          labelPadding: EdgeInsets.all(10),
          isScrollable: true,
          tabs: [
            Icon(Icons.camera_alt),
            Container(
              width: 90,
              alignment: Alignment.center,
              child: Text(
                "SOHBETLER",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 90,
              alignment: Alignment.center,
              child: Text(
                "DURUM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 90,
              alignment: Alignment.center,
              child: Text(
                "ARAMALAR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        KameraAnaSayfa(),
        Sohbetler(),
        Center(child: Text("durum")),
        Center(child: Text("aramalar")),
      ]),
    );
  }
}
