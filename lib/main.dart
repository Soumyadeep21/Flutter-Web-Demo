import 'dart:async';

import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Web'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = "Welcome to Flutter Web";
  String hour,minute,second,date,month,year;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 30), changeTime);
  }
  void changeTime(Timer timer) {
    setState(() {
      hour = DateTime.now().hour.toString();
      minute = DateTime.now().minute.toString();
      second = DateTime.now().second.toString();
      date = DateTime.now().day.toString();
      month = DateTime.now().month.toString();
      year = DateTime.now().year.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,Colors.yellow])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[        
              Text(
                txt,
                style: TextStyle(
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(onPressed: (){
                setState(() {
                  txt = "Flutter Web is Awesome!";
                });
              },child: Text("Press Me!"),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Text(
                "Date : $date / $month / $year",
                style: TextStyle(
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),
                Text(
                "Time $hour:$minute:$second",
                style: TextStyle(
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
