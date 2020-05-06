import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post ;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Deals Forever'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  color: Colors.purple[200],
                  width: double.infinity,
                  child: Image.network(
                          '${widget.post.data["image"]}',
                          fit: BoxFit.contain,
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0,),
                    Row(children: <Widget>[
                      Expanded(child: Text("by ${widget.post.data["by"]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),),
                      Icon(Icons.date_range),
                      Text("${widget.post.data["time"].toDate().toString().replaceAll(new RegExp(r'[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}'), "")}")
                    ],),
                    SizedBox(height: 12.0,),
                    Text("${widget.post.data["title"]}",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 18,),textAlign: TextAlign.justify,),
                    Divider(thickness: 3,),
                    SizedBox(height: 8.0,),
                    SingleChildScrollView(
                      child: Html(
                        data:widget.post.data["text"],
                        padding: EdgeInsets.all(8.0),
                        onLinkTap: (url) {
                          print("Opening $url...");
                          launch(url);
                        },
                        onImageTap: (src) {
                          print(src);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}