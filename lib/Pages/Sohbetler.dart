import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';
import 'package:whatsapp_clone/Pages/KisiSec.dart';
import 'package:whatsapp_clone/Cards/CustomCard.dart';

class Sohbetler extends StatefulWidget {
  const Sohbetler({Key key}) : super(key: key);

  @override
  _SohbetlerState createState() => _SohbetlerState();
}

class _SohbetlerState extends State<Sohbetler> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Kübra",
      hasPhoto: true,
      isGroup: false,
      currentMessage: "sadsadfasgakm",
      time: "02:07",
      icon: "assets/k.jpeg",
    ),
    ChatModel(
      name: "Ferhat",
      hasPhoto: false,
      isGroup: false,
      currentMessage: "Naber?",
      time: "18:50",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Arzu",
      hasPhoto: false,
      isGroup: false,
      currentMessage: "Naber?",
      time: "Dün",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Sosyal Dayanışma ve Yardımlaşma",
      isGroup: true,
      hasPhoto: false,
      currentMessage: "Yardım paralarını toplayalım arkadaşlar :D",
      time: "16:10",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Okul",
      isGroup: true,
      hasPhoto: false,
      currentMessage: "not paylaşın",
      time: "10:10",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Hilal",
      isGroup: false,
      hasPhoto: false,
      currentMessage: "alsdkasğdlsaüğdlsaüğdplü",
      time: "16:10",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Mining",
      isGroup: true,
      hasPhoto: false,
      currentMessage: "Reklam yapmak yasaktır",
      time: "23:55",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Selin",
      isGroup: false,
      currentMessage: "Bdaskldnnasokkopasdasdçööm",
      time: "06:10",
      hasPhoto: false,
      icon: "person.svg",
    ),
    ChatModel(
      name: "Ali",
      isGroup: false,
      currentMessage: "Görüşelim",
      time: "Geçen Hafta",
      hasPhoto: false,
      icon: "person.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex, index) => CustomCard(chatModel: chats[index]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          backgroundColor: Color(0xff25D366),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => KisiSec()));
          }),
    );
  }
}
