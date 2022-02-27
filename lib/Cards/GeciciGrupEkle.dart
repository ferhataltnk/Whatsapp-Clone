import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeciciGrupEkle extends StatelessWidget {
  const GeciciGrupEkle({Key key, this.kisiler}) : super(key: key);
  final ChatModel kisiler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Column(
        children: [
          Container(
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
                            backgroundColor: Colors.grey,
                            radius: 10,
                            child: Icon(
                              Icons.close,
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
          Flexible(
            /*Container içine sığmayan bi şey koyduğumuzda flexible ile sarmalıyoruz. */
            child: Container(
              width: 52,
              child: Text(
                kisiler.name,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
