import 'package:flutter/material.dart';

import 'DataFile.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample app"),

        ),
        body: MyButton()
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10,top: 0,right: 10, bottom:0),
        child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage(data: List.generate(15,
                        (i) => DataFile('Task $i', 'Item no. $i',),),),
                  ));
            },

            child: const Text("Go to Next Screen", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14),)

        ))

    );
  }

}
