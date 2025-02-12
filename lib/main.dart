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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
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

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}


double redCardHeight = 0;
double blueCardHeight = 0;
int redCardScore = 0;
int blueCardScore = 0;
double winningHeight = 0;

bool initialize = false;

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {

    winningHeight = MediaQuery.of(context).size.height - 60;

    if (initialize == false){
      blueCardHeight = MediaQuery.of(context).size.height/2;
      redCardHeight = MediaQuery.of(context).size.height/2;

      initialize = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,

            onPressed: (){
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
                blueCardScore = blueCardScore + 5;
              });

              if (blueCardHeight > winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(blueCardScore,"b")));
            }
            },

            

            child: Container(
              color: Colors.blueAccent,
              height: blueCardHeight,
              width: double.infinity,
               alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              
              child: Row(
                children: [
                  Expanded(
                    child: Text("Player B ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Text(blueCardScore.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
          ),

          MaterialButton(

            padding: EdgeInsets.zero,

            onPressed: (){
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
                redCardScore = redCardScore + 5;
              });

              if (redCardHeight > winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(redCardScore,"a")));
            }
            },

            

            child: Container(
              color: Colors.redAccent,
              height: redCardHeight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              
              child: Row(
                
                children: [
                  Expanded(
                    child: Text("Player A ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Text(redCardScore.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget{

  int score = 0;
  String player = "";

  ResultPage(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      appBar: AppBar(
        title: Text("Results"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),),
        
            Text( player == "a" ? "Player A Won!" : "Player B Won!",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400
            ),),

            MaterialButton(
              onPressed: (){
                
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Restart Game"),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}