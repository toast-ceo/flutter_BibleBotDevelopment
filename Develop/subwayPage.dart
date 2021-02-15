import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';

Future getJsonFromXMLUrl() async {
  final Xml2Json xml2Json = Xml2Json();
  try {
    var response = await http.get(
        "");
    var data = utf8.decode(response.bodyBytes);
    xml2Json.parse(data);
    var jsonString = xml2Json.toParker();

    return jsonDecode(jsonString);
  } catch (e) {}
}

Future getSecondJsonFromXMLUrl() async {
  final Xml2Json xml2Json = Xml2Json();
  try {
    var response = await http.get(
        "");
    var data = utf8.decode(response.bodyBytes);
    xml2Json.parse(data);
    var jsonString = xml2Json.toParker();
    return jsonDecode(jsonString);
  } catch (e) {}
}

class SubwayPage extends StatefulWidget {
  @override
  _SubwayPageState createState() => _SubwayPageState();
}

class _SubwayPageState extends State<SubwayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "새로고침",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                IconButton(
                    icon: Icon(
                      Icons.autorenew,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        getJsonFromXMLUrl();
                        getSecondJsonFromXMLUrl();
                      });
                    })
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: FutureBuilder(
                    future: getJsonFromXMLUrl(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data['realtimeStationArrival']['row']);
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 130,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "중계",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                Radius.circular(20)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "하계",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "노원",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          height: 80,
                                          width: 100,
                                          child: ListView.builder(
                                          itemCount: 4,
                                          itemBuilder: (context, index){
                                            return Container(
                                              height: 20,
                                              child: Row(children: <Widget>[
                                                if(snapshot.data['realtimeStationArrival']['row'][index]['updnLine']=='상행')
                                                  Text("${snapshot.data['realtimeStationArrival']['row'][index]['updnLine']}"),
                                              ],),
                                            );
                                          }
                                          ),
                                        ),
                                        Container(width:2,height: 100,color: Colors.grey[400],),
                                        Container(
                                          height: 80,
                                          width: 100,
                                          child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (context, index){
                                                print(snapshot.data['realtimeStationArrival']['row'][index]['rowNum']);
                                                return Container(
                                                  height: 20,
                                                  child: Row(children: <Widget>[
                                                    Text("${snapshot.data['realtimeStationArrival']['row'][index]['rowNum']}"),
                                                  ],),
                                                );
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else
                        return Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ));
                    }),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: FutureBuilder(
                    future: getSecondJsonFromXMLUrl(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data['realtimeStationArrival']['row']);
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[300],
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[300],
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 130,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "노원",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[300],
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                Radius.circular(20)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "상계",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "창동",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      color: Colors.grey[300],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else
                        return Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ));
                    }),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: FutureBuilder(
                    future: getSecondJsonFromXMLUrl(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data['realtimeStationArrival']['row']);
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 130,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "노원",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                Radius.circular(20)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "중계",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "마들",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      color: Colors.grey[300],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else
                        return Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
