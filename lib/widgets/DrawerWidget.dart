import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fwf/pages/PageR.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String name = "";
  String msg ='Please Login';
  String txt ='Sign In';
  String log ='Register';
  bool _isLogin = false;




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),

            _createDrawerItem(
                icon: Icons.share,
                text: 'FIFMI Abu DHABI',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageR()),
//
                  );
                }
                ),
            _createDrawerItem(
                icon: Icons.shopping_cart,
                text: 'Account',
                onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => MyHomePage()),
////                      MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
//                    );
                }
                ),
            _createDrawerItem(
                icon: Icons.call,
                text: 'Contact Us',
                onTap: () =>{
                //   Navigator.push(
                // context,
                // MaterialPageRoute(
                // builder: (context) => GoogleSignApp()),
                // )
            }),

                    _createDrawerItem(
                icon: Icons.info_outline,
                text: 'About Us',
                onTap: () =>{ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageR()),
                )}

      ),
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: txt,
                onTap: () =>{}
//                    _checkLogin()
            ),
            _createDrawerItem(
                icon: Icons.lock_open,
                text: log,
                onTap: () {
                  //_LogOut();

//                  _setLogOut();
                },
            ),
            Text('gabriel musodza')
          ],
        ),
      ),
    );
  }


  Widget _createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Image.asset(
                'assets/index.png',
                width: 130,
                height: 130,
              ),
            ),
          ),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("$msg  $name",
                  style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color(0xFF808080),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              text,
              style: TextStyle(color: Color(0xFF484848)),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}