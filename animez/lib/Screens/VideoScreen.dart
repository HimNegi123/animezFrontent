import 'package:android_intent/android_intent.dart';
import 'package:animez/Models/AnimeScreenModel.dart';
import 'package:animez/RestApi/ApiDataCalling.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final List<Episode> data;
  final String animeName;
  VideoScreen({required this.data,required this.animeName});
  @override
  State<StatefulWidget> createState() {
    return VideoScreenState(data,animeName);
  }
}

class VideoScreenState extends State<VideoScreen> {
late String vidid;
late List<Episode> value;
late String name;
VideoScreenState(this.value,this.name);
@override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      var obj1=ApiDataCalling().getTrailer(name);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
    SizedBox(
  height: MediaQuery.of(context).size.height * 0.35,
  width: double.infinity,
  child: FutureBuilder(
    future: obj1,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: snapshot.data!.vidId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
            ),
          ),
        );
      } else {
        return Shimmer.fromColors(
          baseColor:const Color.fromARGB(255, 92, 89, 89),
          highlightColor: const Color.fromARGB(255, 106, 101, 101),
          child: Container(
            color: const Color.fromARGB(255, 103, 99, 99),
          ),
        );
      }
    },
  ),
),      
        Row(
          children: [
              Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.grey[800],
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "TRAILER OF $name",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 229, 169, 169),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
            Image.asset('assets/stream.png')
          ],
        ),
          const Divider(
            color: Colors.white,
            thickness: 1.0,
          ),   
          const Padding(
            padding: EdgeInsets.all(2),
            child: Text(
              "Episodes List:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30),
            ),
          ),
          
  SizedBox(
    height: screenHeight*0.52,
    child: GridView.count(
      crossAxisCount: 5,
      children: List.generate(value.length, (index) {
        return  Padding(
        padding: const EdgeInsets.all(4.0),
        child:
         GestureDetector(onTap:()async{
var  data=await  ApiDataCalling().getEpUrl(value[index].url);
 AndroidIntent intent = AndroidIntent(
    action: 'action_view',
    data: 'https:${data.url.toString()}',
    package: 'com.brave.browser',
     flags: [0x40000000],
  );
  await intent.launch();
Fluttertoast.showToast(
    msg: "This is a toast message.",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
    fontSize: 16.0
);
        },child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 69, 71, 71),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              'Ep-${index+1}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),)
      );

      }),
    ),
  ),    
        ],
      ),
    );
  }
}
