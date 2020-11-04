// import 'package:flutter/material.dart';
//
// import 'TaskModel.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final textController = TextEditingController();
//
//   List<TaskModel> tasks = [];
//
//   TaskModel currentTask;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ToDoHelper _todoHelper = ToDoHelper();
//     return Scaffold(
//       body: Container(
//         padding:EdgeInsets.all(32),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: textController,
//             ),
//             FlatButton(
//               child: Text("Insert"),
//               onPressed: (){
//                 currentTask = TaskModel(name: textController.text);
//                 _todoHelper.insertTask(currentTask);
//               },
//               color: Colors.blue,
//               textColor: Colors.white,
//             ),
//             FlatButton(
//               child: Text("Show All Task"),
//               onPressed: () async{
//                 List<TaskModel> list = await _todoHelper.getAllTasks();
//
//                 setState(() {
//                   tasks = list;
//                 });
//               },
//               color: Colors.red,
//               textColor: Colors.white,
//             ),
//
//             Expanded(
//               child: ListView.separated(
//                 itemBuilder: (context, index){
//                   return ListTile(
//                     leading: Text("${tasks[index].id}"),
//                     title: Text("${tasks[index].name}"),
//                   );
//                 },
//                 separatorBuilder: (context, index) => Divider(),
//                 itemCount: tasks.length,
//
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//--------------------------------------------------------------------------

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: MyFirstPage(),
//   ));
// }
//
// class MyFirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('first_test'),
//           centerTitle: true,
//           backgroundColor: Colors.lightBlueAccent,
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => secondPage()),
//               );
//             },
//           child: Icon(Icons.add),
//           backgroundColor: Colors.lightBlueAccent,
//         ),
//         body: ListView.builder(
//
//         ),
//     );
//   }
// }
//
// class secondPage extends StatelessWidget {
//   TextEditingController myText = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('add_page'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
//                 child: TextField(
//                   controller: myText,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),),
//               ),
//               RaisedButton(
//                 onPressed: click_ok,
//                 child: Text('OK'),
//                 disabledColor: Colors.lightBlueAccent,
//                 textColor: Colors.black,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   String click_ok() {
//     return myText.text;
//   }
// }
//
//
//----------------------------------------------------------------------------

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
            trailing: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    myAlert.deleteAlert(alerts[index].id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    EditPage(hour: alerts[index].hour, minute: alerts[index].minutes,);
                  },
                )
              ]
            ),
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
