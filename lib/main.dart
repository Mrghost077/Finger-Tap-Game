import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: (){
              
                },
                child: Text("START"),
                color: Colors.white,
                shape: CircleBorder(),
                height: 100,
                minWidth: 100,
                ),
            ),
          ),

          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: (){
              
                },
                child: Text("START"),
                color: Colors.white,
                shape: CircleBorder(),
                height: 100,
                minWidth: 100,
                ),
            ),
          )
        ],
      ),
    );
  }
}