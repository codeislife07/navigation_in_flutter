import 'package:flutter/material.dart';
import 'package:navigation_in_flutter/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //naviagate as default screen
      initialRoute: "main",
      //this is a route of app
      routes: {
        "main":(BuildContext context)=>MyHomePage(),
        "second":(BuildContext context)=>SecondScreen(name: "",),
      },
      //if you use method 3 than comment this line
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Navigation Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: name,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondScreen(name:name.text)));
            }, child: Text("Method 1"))
            ,ElevatedButton(onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_)=>SecondScreen(name:''),
                  settings:RouteSettings(
                    arguments: {
                      'name':name.text,
                      'type':2
                    })
              ),
              );
            }, child: Text("Method 2"))
            ,ElevatedButton(onPressed: (){
              Navigator.pushNamed(
                  context,
                "second",
                  arguments: {
                    'name':name.text,
                    'type':3
                  }
              );
            }, child: Text("Method 3"))
          ],
        ),
      ),
    );
  }

}
