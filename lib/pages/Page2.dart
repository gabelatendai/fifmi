import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fwf/models/GridTiles.dart';
import 'package:fwf/models/GridTilesModel.dart';
import 'package:fwf/models/Model.dart';
import 'package:fwf/widgets/CircularProgress.dart';
import 'package:http/http.dart' as http;
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  List<Model>_Prolist = [];

  Future <Model>getProducts() async {
    setState(() {
      loading = true;
    });
    _Prolist.clear();
    String urldata ="http://adfifmedia.org/fetch.php";
    final response = await http.get(urldata);
    // final response = await http.get(url + "?id=${user_id}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _Prolist.add(Model.fromJson(i));
          loading = false;
        }
      });
    }
    print(urldata);
    print(_Prolist.length);

  }
  var loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchProducts();
      getProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar:AppBar(title: AutoSizeText('Indulge into the Word of God',maxLines: 1,),),
        body:ListView(
            shrinkWrap: true,
            children:<Widget> [
              Image.asset('assets/a.jpg'),
              FutureBuilder(
                  future: fetchProducts(),
                  builder: (context,snapshot){
                    if(snapshot.data==null){
                      return Container(
                        child:  CircularProgress(),
                      );
                      //child: Products(),
                    }else{
                      return  GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount:snapshot.data.length,
                          gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            Model products= snapshot.data[index];
                            return
                              GridTilesModel(
                                name: products.name,
                                id: products.id,
                                views: products.views,
                                title: products.title,
                                profile: "http://adfifmedia.org/uploads/listings/${products.profile}",
                                description:products.description,
                                video:'http://adfifmedia.org/files/${products.vidio}',
                                category: products.category,
                                date: products.date,
//                            date: products.date,
                              );
                          });
                    }
                  }
              )
            ] )
    );


  }
}

Model products;

Future<List<Model>> fetchProducts() async{
  String url ="http://adfifmedia.org/fetch.php?sermons=sermons";
  final response = await http.get(url);
  return modelFromJson(response.body);

}