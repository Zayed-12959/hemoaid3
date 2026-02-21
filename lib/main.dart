import 'package:flutter/material.dart';
import 'package:container/Dashboard.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}): super(key:key);

  @override
  State<StatefulWidget> createState() =>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Container',
        ),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.lightGreen,
          child: Center(
            child: Text('Hello world'),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        label: Text('NEXT PAGE'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
