import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fwf/models/Events.dart';

import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';



class H extends StatefulWidget {
  String id;
  String title;
  String name;
  String profile;
  String description;

  H({Key key, @required this.id,@required
  this.title,@required
  this.name,@required
  this.description,
    @required
  this.profile, }): super(key: key);

  @override
  _HState createState() => _HState();
}

class _HState extends State<H> {
  var loading = false;
  bool isClicked = false;
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Color selection = Colors.green[400];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) =>ProfileScreen()),
//                      );
                    },
                    child: Icon(Icons.person_pin,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                        ),
                        color: Colors.black,
                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>ShoppingCartScreen()),
//                          );
                        },
                      ),
                      isClicked
                          ? Positioned(
                        left: 9,
                        bottom: 13,
                        child: Icon(
                          Icons.looks_one,
                          size: 14,
                          color: Colors.red,
                        ),
                      )
                          : Text(''),
                    ],
                  ),
                ],
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height / 2.4,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("${widget.profile}"),
                            fit: BoxFit.contain),
                      ),
//                  Column(
//                    children: <Widget>[
//                      Image.asset("assets/m1.jpeg")
//                    ],
//                  ),
                    ),
                  ),
                )     ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(width: 130, child: Text("Name ")),
                            SizedBox(
                              width: 48,
                            ),
                            Text(widget.name),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ), //Product Info
                _buildDescription(context),
//                _buildProducts(context),
//                _buildReviewsStat(widget.product.rating)
              ],
            ),
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Shopping Cart"),
      content: Text("Your product has been added to cart."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



//  dottedSlider() {
//    return DottedSlider(
//      maxHeight: 200,
//      children: <Widget>[
//        _productSlideImage(widget.product.image),
//      ],
//    );
//  }

//  _buildInfo(context) {
//    return Container(
//      width: MediaQuery.of(context).size.width,
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Container(width: 130, child: Text("Product Type")),
//                SizedBox(
//                  width: 48,
//                ),
//                Text(widget.title),
//              ],
//            ),
//            SizedBox(
//              height: 8,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Container(width: 130, child: Text("Available sizes")),
//                SizedBox(
//                  width: 48,
//                ),
//                Text(widget.startdate.toString()),
//              ],
//            ),
//            SizedBox(
//              height: 8,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Container(width: 130, child: Text("Available Colors")),
//                Text(widget.enddate.toString()),
//              ],
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 12.0),
//              child: Text(widget.title,
//                style: TextStyle(color: Colors.black45),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }



  _buildDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 3.8,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(widget.description),

          ],
        ),
      ),
    );
  }

}

