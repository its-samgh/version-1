import 'package:flutter/material.dart';
import 'main.dart';
import 'TaskModel.dart';

class secondPage extends StatefulWidget {
  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  TextEditingController hour = TextEditingController();

  TextEditingController minute = TextEditingController();

  AlertOptions myAlert = AlertOptions();

  String minuteError, hourError;

  @override
  Widget build(BuildContext context) {
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

