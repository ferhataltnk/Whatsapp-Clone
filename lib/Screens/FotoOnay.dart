import 'dart:io';

import 'package:flutter/material.dart';

class FotoOnay extends StatelessWidget {
  const FotoOnay({Key key, this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(
            icon: Icon(
              Icons.crop_rotate,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                /*dart.io dosyası içinde geliyor */
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                        margin: EdgeInsets.only(bottom: 8, left: 3, right: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Başlık ekleyin..",
                            contentPadding: EdgeInsets.all(5),
                            prefixIcon: IconButton(
                              icon: Icon(
                                Icons.collections,
                                color: Colors.grey[800],
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 2),
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF128C7E),
                        child: IconButton(
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
