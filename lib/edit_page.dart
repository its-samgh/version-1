import 'package:flutter/material.dart';
import 'TaskModel.dart';

class EditPage extends StatefulWidget {
  final String hour;
  final String minute;
  EditPage({this.hour, this.minute});

  @override

  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  AlertOptions myAlert = AlertOptions();

  String minuteError, hourError;

  @override

  Widget build(BuildContext context) {
    TextEditingController hour = TextEditingController(text: widget.hour.toString());
    TextEditingController minute = TextEditingController(text: widget.minute.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('add_page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: TextField(
                controller: hour,
                decoration: InputDecoration(
                    hintText: 'hour',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: TextField(
                controller: minute,
                decoration: InputDecoration(
                    hintText: 'minute',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            RaisedButton(
              onPressed: () {
                myAlert.insertAlert(
                    AlertModel(
                      hour: hour.text,
                      minutes: minute.text,
                    )
                );
                print(myAlert.alerts().toString());
                Navigator.pop(context);
              },
              child: Text('OK'),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
