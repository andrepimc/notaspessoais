import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String note;
  final VoidCallback onTap;
  const CardComponent({Key? key, required this.note, required this.onTap,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note),
        onTap: onTap,
      ),
    );
  }
}