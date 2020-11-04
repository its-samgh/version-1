
import 'second_page.dart';
import 'edit_page.dart';

import 'TaskModel.dart';
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: firstPage(),
  ));
}

class firstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List alerts = [];
  AlertOptions myAlert = AlertOptions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              List list = await myAlert.alerts();
              setState(() {
                alerts = list;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                'minutes: ${alerts[index].minutes}, hour: ${alerts[index].hour}'
            ),
            // trailing: Row(
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.delete),
            //       onPressed: () {
            //         myAlert.deleteAlert(alerts[index].id);
            //       },
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.edit),
            //       onPressed: () {
            //         EditPage(hour: alerts[index].hour, minute: alerts[index].minutes,);
            //       },
            //     )
            //   ]
            // ),
          );
        },
        itemCount: alerts.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => secondPage()));
        },
      ),
    );
  }
}
