import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class replyMessageBox extends StatelessWidget {
  const replyMessageBox({Key key, this.onceki = 2}) : super(key: key);

  final int kendisi = 0;
  final int onceki;

  @override
  Widget build(BuildContext context) {
    double px = 1 / MediaQuery.of(context).devicePixelRatio;

    return Bubble(
      margin: (kendisi == onceki)
          ? BubbleEdges.only(left: 21, top: 3)
          : BubbleEdges.only(left: 12, top: 7),
      alignment: Alignment.topLeft,
      stick: true,
      color: Colors.white,
      nip: (kendisi == onceki) ? BubbleNip.no : BubbleNip.leftTop,
      radius: Radius.circular(10.0),
      nipWidth: 10,
      nipHeight: 14,
      nipRadius: 2.0,
      elevation: 0.5 * px,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 100, minWidth: 50),
        child: Stack(
          /*Stack harici hiç bi widgetla değişken boyut elde edemedim.Wrap dahil */
          children: [
            Container(
              padding: EdgeInsets.only(right: 55, bottom: 2),
              child: Text(
                "Mesasadzasdsadsaddfdsfdsfdsfdsfsdfasfasdasdasdaw",
                style: TextStyle(overflow: TextOverflow.visible),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(top: 2, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "04:15",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
