import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:fwf/widgets/CircularProgress.dart';

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  String url ="";
@override
  void initState() {
    // TODO: implement initState

    super.initState();
    setState(() {
      url= "https://livestream.com/accounts/19491040/events/8258678/player?enableInfoAndActivity=false&defaultDrawer=&autoPlay=false&mute=false";

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: AutoSizeText("Watch Ezekiel TV Now"),),
      body: Center(
       child:
       WebviewScaffold(url: url,
       )




      ),
    );


  }
}
