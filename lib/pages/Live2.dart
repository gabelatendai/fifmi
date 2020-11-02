import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fwf/widgets/AppBarWidget.dart';

class Live2 extends StatefulWidget {
  @override
  _Live2State createState() => _Live2State();
}

class _Live2State extends State<Live2> {
  String url = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      url="https://fifministriesabudhabi.online.church";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join One of Our Services'),),
      body: Center(

        child: WebviewScaffold(
          url: url,

        ),
      ),
    );


  }
}
