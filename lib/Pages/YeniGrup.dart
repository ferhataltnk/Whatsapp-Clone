import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Cards/GeciciGrupEkle.dart';
import 'package:whatsapp_clone/Cards/KisiCardAdd.dart';
import 'package:whatsapp_clone/Cards/kisiCard.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';

class YeniGrup extends StatefulWidget {
  const YeniGrup({Key key}) : super(key: key);

  @override
  State<YeniGrup> createState() => _YeniGrupState();
}

class _YeniGrupState extends State<YeniGrup> {
  List<ChatModel> kisiler = [
    ChatModel(hasPhoto: false, name: "Ali", durum: "xczxcxz"),
    ChatModel(
      hasPhoto: false,
      name: "Arzu",
      durum: "Merhaba! Ben WhatsApp Kullanıyorum.",
    ),
    ChatModel(hasPhoto: false, name: "Ferhat", durum: "."),
    ChatModel(hasPhoto: false, name: "Fuat", durum: "asdsagsafwads"),
    ChatModel(hasPhoto: false, name: "Güler", durum: "qweqewqeqw"),
    ChatModel(hasPhoto: false, name: "Hilal", durum: "TR"),
    ChatModel(
        hasPhoto: true,
        name: "Kübra",
        durum: "Merhaba!..."),
    ChatModel(hasPhoto: false, name: "Selin Balcı", durum: "asdasdsa"),
  ];

  List<ChatModel> gruplar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yeni grup",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Katılımcı ekle",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: kisiler.length + 1,
              /*Listeyi bir artırdım çünkü ilk eleman yerine boş container koymuştum. */
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: gruplar.length > 0
                        ? 90
                        : 0, /*Listenin birinci elemanına kişicard yerine  container koyuyorum.Setstate ile boyunu güncelleyerek listeyi aşağı doğru itmiş oluyorum. */
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (kisiler[index - 1].tik == false) {
                        kisiler[index - 1].tik = true;
                        gruplar.add(kisiler[index - 1]);
                      } else {
                        kisiler[index - 1].tik = false;
                        gruplar.remove(kisiler[index - 1]);
                      }
                    });
                  },
                  child: KisiCard(
                    kisiler: kisiler[index - 1],
                  ),
                );
              }),
          gruplar.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: kisiler.length,
                          itemBuilder: (context, index) {
                            if (kisiler[index].tik == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    gruplar.remove(kisiler[index]);
                                    kisiler[index].tik = false;
                                  });
                                },
                                child: GeciciGrupEkle(
                                  kisiler: kisiler[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    /*Container'i listviewdan sonra konumlandırdım ki stackte sonra yazılan üstte kalır.Ayrıca divider ve containeri column içine aldım ki stackte üst üste binmesin */
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
