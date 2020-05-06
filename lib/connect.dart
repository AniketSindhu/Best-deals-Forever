import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  String s="""<p><strong>Deals &amp; offer 1:</strong><br /><strong><a href="https://chat.whatsapp.com/LcNfQq1QR2wAIfb10B4eXS">https://chat.whatsapp.com/LcNfQq1QR2wAIfb10B4eXS</a></strong></p>
<p><strong>Deals &amp; offer 2:&nbsp;</strong><strong><a href="https://chat.whatsapp.com/Cit5wxPKkxC8rANnmtnIHj">https://chat.whatsapp.com/Cit5wxPKkxC8rANnmtnIHj</a></strong></p>
<p><strong>BDF offical discussion:-<a href="https://chat.whatsapp.com/HUw86qO2GlbALYMA0FMm8j">https://chat.whatsapp.com/HUw86qO2GlbALYMA0FMm8j</a></strong></p>
<p><strong>For other best deals please join our other whatsapp groups.</strong><br /><strong>1.Reviews:-<a href="https://chat.whatsapp.com/E9DuaJ9MwPSK9xoDQRPSQe">https://chat.whatsapp.com/E9DuaJ9MwPSK9xoDQRPSQe</a></strong><br /><strong>2.Apps:-<a href="https://chat.whatsapp.com/L8fKc3yDHZ6KhX9KMaDcRm">https://chat.whatsapp.com/L8fKc3yDHZ6KhX9KMaDcRm</a></strong><br /><strong>3.Udemy:-<a href="https://chat.whatsapp.com/Iw0MWWvsAsVGzF4PRkvj2b">https://chat.whatsapp.com/Iw0MWWvsAsVGzF4PRkvj2b</a></strong><br /><strong>4.Accounts:-<a href="https://chat.whatsapp.com/EuSENGcjTSOHgme9ZJ8owT">https://chat.whatsapp.com/EuSENGcjTSOHgme9ZJ8owT</a></strong></p>
<p>&nbsp;</p>""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        title:Text("Connect with us",style:TextStyle(color:Colors.white)),
        backgroundColor:Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height:10),
              Container(
                color: Colors.purple[100],
                child: ListTile(
                  title:Text("Follow us on social media:-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                  subtitle: Row(
                    children: <Widget>[
                      SocialMediaButton.twitter(
                        url: "https://twitter.com/BestDealsForev2",
                        size: 70,
                        color: Colors.blue,
                      ),
                      SizedBox(width:25),
                      SocialMediaButton.instagram(
                        url: "https://www.instagram.com/bestdealsforever.co.in/",
                        size: 70,
                        color: Colors.pink,
                      ),
                      SizedBox(width:25),
                      SocialMediaButton.facebook(
                        url: "https://m.facebook.com/best_deals_forever0-108301384182184/?ref=aymt_homepage_panel&eid=ARAYDokgslPgbB1zhDs0q5cDzJq13ReUACjZMlEN8fvZ7efkSFe1DWoW0ZsbO0Pzrrxjhojz0n4tkFma",
                        size: 70,
                        color: Colors.blue,
                      ),
                    ],
                  ),                  
                ),
              ),
              Divider(thickness: 2,),
              SocialMediaButton.whatsapp(url: null,size:70,color:Colors.green),
              Html(
                  data: s,
                  padding: EdgeInsets.all(8.0),
                  onLinkTap: (url) {
                    print("Opening $url...");
                    launch(url);
                  },
                  onImageTap: (src) {
                    print(src);
                  },
              ),
            ],
          ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: (){launch("https://bestdealsforever.co.in/");},
        icon: Icon(Icons.whatshot,color:Colors.deepOrange),
        label: Text("Our Website"),
        autofocus: true,
        backgroundColor: Colors.deepPurple,
        heroTag: "yo",
      ),
    );
  }
}