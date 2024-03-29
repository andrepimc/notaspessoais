import 'package:flutter/material.dart';
import 'package:notes/components/app_bar_widget.dart';
import 'package:notes/components/card_component.dart';
import 'package:notes/create_note_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeira nota"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Minhas Senhas"),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              CardComponent(
                note: notes[i],
                onTap: () async {
                  var response = (await Navigator.pushNamed(
                      context, "/create-note",
                      arguments: notes[i]));
                  if (response != null) {
                    var description = response as String;
                    if (response.isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i] = description;
                    }
                    setState(() {});
                  }
                },
              ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
