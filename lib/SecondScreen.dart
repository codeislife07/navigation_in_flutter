import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget{
  String? name='';

  SecondScreen({this.name});

  @override
  State<StatefulWidget> createState()=>SecondScreenState();

}

class SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)!.settings.arguments==null?{}:ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Secod Screen"),
      ),
      body: Center(
        child:
        Column(
          children: [
            Divider(),
            Text("Method 1"),
            Text("${widget.name}"),
            Divider(),
            Divider(),
            Text("Method 2"),
            Text(args['type']==2?"${args['name']}":""),
            Divider(),
            Divider(),
            Text("Method 3"),
            Text(args['type']==3?"${args['name']}":""),
            Divider(),
          ],
        ),
      ),
    );
  }
}