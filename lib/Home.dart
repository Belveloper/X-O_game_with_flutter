import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';

class StartRoute extends StatefulWidget {
  @override
  _StartRouteState createState() => _StartRouteState();
}

class _StartRouteState extends State<StartRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "TIC TAC TOE",
                      style: TextStyle(
                          fontFamily: 'PressStart2P',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Image(
                      image: AssetImage("assets/tic-tac-toe.png"),
                      height: 190,
                      width: 200,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, bottom: 60, top: 260),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              'PLAY GAME',
                              style:  TextStyle(fontFamily: 'PressStart2P',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
