import 'package:flutter/material.dart';

class KisiCardAdd extends StatelessWidget {
  const KisiCardAdd({Key key, this.text, this.icon, this.ontap})
      : super(key: key);
  final String text;
  final IconData icon;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff25D366),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
