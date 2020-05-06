import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'details.dart';
import 'connect.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice='40ABAD1F19A4308BD059F23F20EE1B9F';

class DealPage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.deepOrangeAccent,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.purple[100],
          appBar: AppBar(
            centerTitle: true,
            title: Text('Best Deals Forever'),
            leading: Icon(Icons.category),
            bottom: TabBar(
              isScrollable: false,
              labelColor: Colors.white,
              indicatorColor: Colors.deepOrange,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Here you will get best deals on everything"),
                ),
              ],
            ),
          ),
          body: ListPage(),
          floatingActionButton: new FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>Connect()));
                RewardedVideoAd.instance.show();
                },
              icon: Icon(Icons.whatshot,color:Colors.deepOrange),
              label: Text("Connect with us"),
              autofocus: true,
              backgroundColor: Colors.deepPurple,
              heroTag: "yo",
        ),
      ),
      )
    );
  }
 }


 class ListPage extends StatefulWidget {
   @override
    ListPageState createState() =>  ListPageState();
 }
 
 class ListPageState extends State<ListPage> {
    int count=1;
    BannerAd _bannerAd;
    NativeAd _nativeAd;
    InterstitialAd _interstitialAd;
    static const MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
      testDevices:testDevice!=null? <String>[testDevice]: null,
      nonPersonalizedAds: true,
      keywords: <String>['games','shop','amazon','e commerce','blog','buy','news','medical']);
    BannerAd CreateBannerAd(){
      return BannerAd(
        adUnitId: 'ca-app-pub-2220364105763090/4986789836',
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event){
          print("banner ad $event");
        }
      );
    }
    InterstitialAd CreateInterstitialAd(){
      return InterstitialAd(
        adUnitId: 'ca-app-pub-2220364105763090/4413156335',
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event){
          print("InterstitialAd $event");
        }
      );
    }
    

  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(post: post,)));
  }
  
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn= await firestore.collection("deals").orderBy('time', descending: true).getDocuments();
    return qn.documents;
  }
  @override
  void initState(){
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-2220364105763090~2552198183');
    _bannerAd=CreateBannerAd()..load()..show(anchorType: AnchorType.bottom,);
    RewardedVideoAd.instance.load(
    adUnitId:'ca-app-pub-2220364105763090/5893758962',
    targetingInfo: targetingInfo,);
    super.initState();

  }
  @override
  void dispose(){
    _bannerAd..dispose();
    _interstitialAd..dispose();
    super.dispose();
  }
  
   @override
   Widget build(BuildContext context) {
     return Stack(
       children: <Widget>[
           FutureBuilder(
             future:getPosts(),
             builder:(_, snapshot){
             if (snapshot.connectionState==ConnectionState.waiting)
                { return Center(child:Text("Loading..."));}
             else
               return ListView.separated(
                 padding: const EdgeInsets.all(16.0),
                 itemCount: snapshot.data.length,
                 itemBuilder: (_, index) {
                   return InkWell(
                    onTap:(){if(count<=2||count%2==0){
                        _interstitialAd=CreateInterstitialAd()..load()..show();
                          }
                        count++;
                        navigateToDetail(snapshot.data[index]);
                      },
                    child: Container(
                     color: Colors.white,
                     child: Stack(
                     children: <Widget>[
                      Container(
                       width: 90,
                       height: 90,
                       color: Colors.deepOrange[200],
                     ),
             Container(
             color: Colors.white,
             padding: const EdgeInsets.all(16.0),
             margin: const EdgeInsets.all(16.0),
             child: Row(
           children: <Widget>[
             Container(
               height: 100,
               color: Colors.blueAccent,
               width: 120.0,
               child: Image.network(
                 '${snapshot.data[index].data["image"]}',
                 fit: BoxFit.fill,
               ),
             ),
             const SizedBox(width: 20.0),
             Expanded(
               child: Column(
                 children: <Widget>[
                     Text(
                       snapshot.data[index].data["title"],
                       textAlign: TextAlign.start,
                       softWrap: true,
                       style: TextStyle(
                         color: Color(0xff324558),
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                       ),
                     ),
                     
                 ],
               ),
             )
           ],
             ),
           )
            ],
          ),
    )
  );
},
             separatorBuilder: (context, index) =>
                 const SizedBox(height: 10.0),);      
           }
        ),       
       ],
     );
   }
 }

 