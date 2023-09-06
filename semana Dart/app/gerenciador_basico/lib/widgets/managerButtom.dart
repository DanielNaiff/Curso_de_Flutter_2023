import 'package:flutter/material.dart';

class managerButton extends StatelessWidget {
  String text;
  Icon icon;
  void Function() onPressed;
  managerButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(height: 40, width: 40, child: Icon(Icons.bar_chart)),
      title: Text(text),
      trailing: SizedBox(
        width: 100,
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
    ;
  }
}
