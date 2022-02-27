import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Cards/MessageBox.dart';
import 'package:whatsapp_clone/Cards/replyMessageBox.dart';
import 'package:whatsapp_clone/Classes/ChatModel.dart';

class IkiliKonusma extends StatefulWidget {
  const IkiliKonusma({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IkiliKonusmaState createState() => _IkiliKonusmaState();
}

class _IkiliKonusmaState extends State<IkiliKonusma> {
  bool emojiShow = false;
  int onceki;

  FocusNode focusNode =
      FocusNode(); /*Emoji picker ile klavye üstüste açılamasın diye textformfield widgeti için focusNode kontrolü yapacağız.*/
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShow = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/chatPage.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF075E54),
            leadingWidth: 70,
            titleSpacing: 0,
            /*İsimle foto arası boşluğun boyutunu ayarlıyor.0 yaptık çünkü container ile sarmalayıp margin vereceğiz*/
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blueGrey,
                      child: widget.chatModel.hasPhoto
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                image: AssetImage("assets/k.jpeg"),
                              ))
                          : SvgPicture.asset(
                              widget.chatModel
                                      .isGroup /*Burada widget.chatModel dedim çünkü statefull tarafında oluşturduğum nesneyi burada kullanıyorum. */
                                  ? "assets/group.svg"
                                  : "assets/person.svg",
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Son görülme ${widget.chatModel.time}",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
              IconButton(icon: Icon(Icons.phone), onPressed: () {}),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Kişiyi Görüntüle"),
                    value: "Kişiyi Görüntüle",
                  ),
                  PopupMenuItem(
                    child: Text("Medya,bağlantılar ve belgeler"),
                    value: "Medya,bağlantılar ve belgeler",
                  ),
                  PopupMenuItem(
                    child: Text("Ara"),
                    value: "Ara",
                  ),
                  PopupMenuItem(
                    child: Text("Bildirimleri Sessize Al"),
                    value: "Bildirimleri Sessize Al",
                  ),
                  PopupMenuItem(
                    child: Text("Duvar kağıdı"),
                    value: "Duvar kağıdı",
                  ),
                  PopupMenuItem(
                    child: Text("Diğer"),
                    value: "Diğer",
                  ),
                ];
              }),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              /*Emojiler açıkken geri tuşuna bastığımda ana sohbet ekranına dönmesini istemediğim için stack ekranını willpopScope widgetiyla sarmaladım.Bu vidgetin onvillpop propertisine anonim fonksiyon atayarak bu sayfadan bu widgeta gerilendiğinde ne yapılması isteniyorsa yaptırabiliyoruz.*/
              child: Stack(
                children: [
                  ListView(
                    children: <Widget>[
                      MessageBox(
                        onceki: onceki,
                      ),
                      replyMessageBox(),
                      MessageBox(
                        onceki: 1,
                      ),
                      replyMessageBox(
                        onceki: 1,
                      ),
                      replyMessageBox(
                        onceki: 0,
                      ),
                      MessageBox(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      bottom: 8, left: 3, right: 3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Bir mesaj yazın",
                                        contentPadding: EdgeInsets.all(5),
                                        prefixIcon: IconButton(
                                          icon: Icon(
                                            Icons.emoji_emotions_outlined,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              emojiShow = !emojiShow;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.attach_file),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    /*Konteynırın içindeki kartın rengi olacak sadece*/
                                                    context: context,
                                                    builder: (builder) =>
                                                        customBottomSheet());
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt),
                                              onPressed: () {},
                                            ),
                                          ],
                                        )),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8, right: 2),
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  )),
                            )
                          ],
                        ),
                        emojiShow ? EmojiSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                setState(() {
                  if (emojiShow) {
                    emojiShow = false;
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget EmojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        // Do something when emoji is tapped
      },
      onBackspacePressed: () {
        // Backspace-Button tapped logic
        // Remove this line to also remove the button in the UI
      },
      config: Config(
          columns: 7,
          emojiSizeMax: 32 *
              (1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          verticalSpacing: 0,
          horizontalSpacing: 0,
          initCategory: Category.RECENT,
          bgColor: Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecentsText: "No Recents",
          noRecentsStyle: const TextStyle(fontSize: 20, color: Colors.black26),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL),
    );
  }

  Widget customBottomSheet() {
    /*Burada wrap widgetıyla tekrar düzenleme yap! */
    return Container(
      /*Direkt card yapamıyorum çünkü card widgetının height width özellikleri yok. */
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.only(bottom: 65, left: 14, right: 14),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconModel(
                    icon: Icons.insert_drive_file,
                    text: "Belge",
                    color: Colors.indigo,
                    onPress: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconModel(
                    icon: Icons.camera_alt,
                    text: "Kamera",
                    color: Colors.pink,
                    onPress: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconModel(
                    icon: Icons.image,
                    text: "Galeri",
                    color: Colors.purple,
                    onPress: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconModel(
                    icon: Icons.headphones,
                    text: "Ses",
                    color: Colors.orange,
                    onPress: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconModel(
                    icon: Icons.file_copy,
                    text: "Oda",
                    color: Colors.blue[900],
                    onPress: () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconModel(
                    icon: Icons.location_pin,
                    text: "Konum",
                    color: Colors.blue,
                    onPress: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconModel(
                    icon: Icons.person,
                    text: "Kişi",
                    onPress: () {},
                  ),
                  SizedBox(width: 200)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconModel(
      {IconData icon, Function onPress, String text, Color color}) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
