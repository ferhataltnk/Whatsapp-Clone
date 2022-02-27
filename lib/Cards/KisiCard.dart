import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';

class KisiCard extends StatelessWidget {
  const KisiCard({Key key, this.kisiler}) : super(key: key);

  final ChatModel kisiler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 52,
        height: 52,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey[200],
              radius: 24,
              child: kisiler.hasPhoto
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset("assets/k.jpeg"),
                    )
                  : SvgPicture.asset(
                      "assets/person.svg",
                      color: Colors.white,
                      height: 30,
                      width: 30,
                    ),
            ),
            kisiler.tik
                ? Positioned(
                    bottom: 1,
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 10,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        kisiler.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        kisiler.durum,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
