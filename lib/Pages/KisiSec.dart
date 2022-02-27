import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Cards/KisiCardAdd.dart';
import 'package:whatsapp_clone/Cards/kisiCard.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';
import 'package:whatsapp_clone/Pages/YeniGrup.dart';

class KisiSec extends StatefulWidget {
  const KisiSec({Key key}) : super(key: key);

  @override
  State<KisiSec> createState() => _KisiSecState();
}

class _KisiSecState extends State<KisiSec> {
  List<ChatModel> Kisiler = [
    ChatModel(hasPhoto: false, name: "Ali Tümmü", durum: "xczxcxz"),
    ChatModel(
      hasPhoto: false,
      name: "Arzu Şen",
      durum: "Merhaba! Ben WhatsApp Kullanıyorum.",
    ),
    ChatModel(hasPhoto: false, name: "Ferhat Altunok", durum: "."),
    ChatModel(hasPhoto: false, name: "Fuat Cebe", durum: "asdsagsafwads"),
    ChatModel(hasPhoto: false, name: "Güler Akın", durum: "qweqewqeqw"),
    ChatModel(hasPhoto: false, name: "Hilal Er", durum: "TR"),
    ChatModel(hasPhoto: true, name: "Kübra", durum: "..."),
    ChatModel(hasPhoto: false, name: "Selin Balcı", durum: "asdasdsa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kişi Seç",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "${Kisiler.length} kişi",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Arkadaş davet edin"),
                  value: "Arkadaş davet edin",
                ),
                PopupMenuItem(
                  child: Text("Kişiler"),
                  value: "Kişiler",
                ),
                PopupMenuItem(
                  child: Text("Yenile"),
                  value: "Yenile",
                ),
                PopupMenuItem(
                  child: Text("Yardım"),
                  value: "Yardım",
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: Kisiler.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return KisiCardAdd(
                icon: Icons.group,
                text: "Yeni grup",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => YeniGrup()));
                },
              );
            } else if (index == 1) {
              return KisiCardAdd(
                icon: Icons.person_add,
                text: "Yeni kişi",
                ontap: () {
                  print("yeni kişi");
                },
              );
            } else {
              return KisiCard(
                kisiler: Kisiler[index - 2],
              );
            }
          }),
    );
  }
}
