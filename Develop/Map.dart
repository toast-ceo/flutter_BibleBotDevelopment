import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List temp;
  bool checkButton;
  Color _selectColor;

  @override
  void initState() {
    super.initState();
    checkButton = false;
    _selectColor = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> building = [
      {
        "name": "갈멜관",
        'color': Colors.blue[100],
        'buildingFloor': ['1층', '2층', '3층']
      },
      {
        "name": "복음관",
        'color': Colors.deepPurple[100],
        'buildingFloor': ['1층', '2층', '3층', '4층']
      },
      {
        "name": "밀알관",
        'color': Colors.yellow[100],
        'buildingFloor': ['1층', '2층', '3층', '4층']
      },
      {
        "name": "모리아관",
        'color': Colors.red[100],
        'buildingFloor': ['1층', '2층', '3층', '4층', '5층']
      },
      {
        "name": "일립관",
        'color': Colors.green[100],
        'buildingFloor': ['1층', '2층', '3층', '4층']
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/select");
            },
          )),
      body: ListView(
        children: [
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: building.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _selectColor = building[index]['color'];
                                    checkButton = true;
                                    temp = building[index]['buildingFloor'];
                                  });
                                  print(checkButton);
                                  print(_selectColor);
                                  print("${building[index]['name']}tap");
                                },
                                child: Text(
                                  "${building[index]['name']}",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                )),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 2,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: _selectColor,
                    height: MediaQuery.of(context).size.width * 0.88,
                    width: MediaQuery.of(context).size.width * 0.88,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 2,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  checkButton
                      ? Container(
                          color: Colors.purple[100],
                          height: MediaQuery.of(context).size.width * 0.88,
                          width: MediaQuery.of(context).size.width * 0.88,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  PopupMenuButton(
                                      itemBuilder: (BuildContext bc) {
                                    return temp
                                        .map((e) => PopupMenuItem(
                                              child: Container(
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              value: e,
                                            ))
                                        .toList();
                                  }, onSelected: (value) {
                                    setState(() {
                                      print(value);
                                    });
                                  }),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.width * 0.88,
                          width: MediaQuery.of(context).size.width * 0.88,
                        ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
