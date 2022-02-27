class ChatModel {
  String name;
  String icon;
  bool hasPhoto;
  bool isGroup;
  String time;
  String currentMessage;
  String durum;
  bool tik = false;

  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.hasPhoto,
    this.durum,
    this.tik = false,
  });
}
