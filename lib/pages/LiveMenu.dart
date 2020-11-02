import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fwf/pages/Live.dart';
import 'package:fwf/widgets/AppBarWidget.dart';

import 'Live2.dart';


class LiveMenu extends StatefulWidget {
  @override
  _LiveMenuState createState() => _LiveMenuState();
}

class _LiveMenuState extends State<LiveMenu> {
  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(0xffF3F3F3);
    final Color primaryColor = Color(0xffE70F0B);
    var now = DateTime.now();
    String g = ('${now.year}/ ${now.month}/ ${now.day}');
    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    var teamNameTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade800,
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar:AppBar( centerTitle: true,title: AutoSizeText('Enjoy The Live Streaming Now',maxLines: 1,),),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          InkWell(
          onTap:(){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Live2()),
    );
    },
         child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/new.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AutoSizeText(
                        "Live Stream",
                        //fifmidubai.online.church
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          AutoSizeText(
                            "Join one of our services",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          AutoSizeText(
                            g.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(4.0),
                    child: AutoSizeText(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
          ),
          const SizedBox(height: 10.0),
        InkWell(
          onTap:(){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Live()),
          );
          },
         child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/img.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AutoSizeText(
                        "Watch Ezekiel TV now",
                        //fifmidubai.online.church
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          AutoSizeText(
                            "Watch Ezekiel TV Now",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          AutoSizeText(
                            g.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(4.0),
                    child: AutoSizeText(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )

        ],
      ),
    );
  }
}

