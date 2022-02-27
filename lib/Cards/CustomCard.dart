import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';
import 'package:whatsapp_clone/Pages/IkiliKonusma.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IkiliKonusma(
                      chatModel: chatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: chatModel.hasPhoto
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          image: AssetImage("assets/k.jpeg"),
                        ))
                    : SvgPicture.asset(
                        chatModel.isGroup
                            ? "assets/group.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 37,
                        width: 37,
                      ),
                backgroundColor: Colors.blueGrey[200],
              ),
              trailing: Text(chatModel.time),
              title: Flexible(
                child: Container(
                  child: Text(chatModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              subtitle: Flexible(
                child: Row(
                  children: [
                    Icon(
                      (Icons.done_all),
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          chatModel.currentMessage,
                          style: TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
