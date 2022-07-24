import 'Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(StartRoute());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var fontstyleblack = TextStyle(
      color: Colors.black, letterSpacing: 3, fontFamily: 'PressStart2P');
  static var fontstyleWhite = TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
      fontFamily: 'PressStart2P');

  bool Otrun = true;
  int filledBoxes = 0;
  int Owins = 0;
  int Xwins = 0;
  List<String> showXorO = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.blueGrey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player O',
                          style: fontstyleWhite,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Owins.toString(),
                          style: fontstyleWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player X', style: fontstyleWhite),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Xwins.toString(),
                          style: fontstyleWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _Clicker(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey.shade50),
                        ),
                        child: Center(
                          child: Text(
                            showXorO[index],
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
                width: 175,
                child: Divider(
                  color: Colors.white,
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 25),
              color: Colors.blueGrey.shade200,
              child: Text(
                "TIC TAC TOE",
                style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }

  _Clicker(int index) {
    setState(() {
      if (Otrun && showXorO[index] == '') {
        showXorO[index] = 'O';
        filledBoxes++;
      } else if (!Otrun && showXorO[index] == '') {
        filledBoxes++;
        showXorO[index] = 'X';
      }
    });
    Otrun = !Otrun;
    _WinnerCheck();
  }

  void _WinnerCheck() {
    if (showXorO[0] == showXorO[1] &&
        showXorO[0] == showXorO[2] &&
        showXorO[0] != '') {
      _showWinDialog(showXorO[0]);
    }

    // checks 2nd row
    if (showXorO[3] == showXorO[4] &&
        showXorO[3] == showXorO[5] &&
        showXorO[3] != '') {
      _showWinDialog(showXorO[3]);
    }

    // checks 3rd row
    if (showXorO[6] == showXorO[7] &&
        showXorO[6] == showXorO[8] &&
        showXorO[6] != '') {
      _showWinDialog(showXorO[6]);
    }

    // checks 1st column
    if (showXorO[0] == showXorO[3] &&
        showXorO[0] == showXorO[6] &&
        showXorO[0] != '') {
      _showWinDialog(showXorO[0]);
    }

    // checks 2nd column
    if (showXorO[1] == showXorO[4] &&
        showXorO[1] == showXorO[7] &&
        showXorO[1] != '') {
      _showWinDialog(showXorO[1]);
    }

    // checks 3rd column
    if (showXorO[2] == showXorO[5] &&
        showXorO[2] == showXorO[8] &&
        showXorO[2] != '') {
      _showWinDialog(showXorO[2]);
    }

    // checks diagonal
    if (showXorO[6] == showXorO[4] &&
        showXorO[6] == showXorO[2] &&
        showXorO[6] != '') {
      _showWinDialog(showXorO[6]);
    }

    // checks diagonal
    if (showXorO[0] == showXorO[4] &&
        showXorO[0] == showXorO[8] &&
        showXorO[0] != '') {
      _showWinDialog(showXorO[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade400,
            title: Text("Winner is : $winner"),
            actions: [
              FlatButton(
                  onPressed: () {
                    _ResetBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Play again ?",
                    style: TextStyle(fontSize: 15.0, color: Colors.cyan),
                  ))
            ],
          );
        });
    if (winner == 'X' && filledBoxes < 9)
      Xwins++;
    else if (winner == 'O' && filledBoxes < 9) Owins++;
  }

  void _ResetBoard() {
    setState(() {
      for (int i = 0; i < showXorO.length; i++) {
        showXorO[i] = '';
      }
    });
    filledBoxes = 0;
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade400,
            title: Text("Draw "),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _ResetBoard();
                  },
                  child: Text(
                    "Play again ?",
                    style: TextStyle(fontSize: 15.0, color: Colors.cyan),
                  ))
            ],
          );
        });
  }
}
