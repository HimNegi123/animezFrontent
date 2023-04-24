import 'package:animez/Models/AnimeScreenModel.dart';
import 'package:animez/RestApi/ApiDataCalling.dart';
import 'package:animez/Screens/VideoScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnimeScreen extends StatefulWidget{
  
  final String data;
 const AnimeScreen({Key? key, required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
 return AnimeScreenState(data);
  }
}
class AnimeScreenState extends State<AnimeScreen>{
  final String data;
  AnimeScreenState(this.data);
   @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
       Future<AnimeScreenModel> obj=ApiDataCalling().animeApi(data);
      final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 23),
      body:FutureBuilder<AnimeScreenModel>(future:obj,builder: ((context, snapshot){
 if(snapshot.hasData){
  return  CustomScrollView(
         slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
SizedBox(
  height:screenHeight*0.47,
width: MediaQuery.of(context).size.width,
   child:    Stack(
        children: [
             Positioned(
  left: screenWidth * 0.05,
  top: screenHeight * 0.1,
  child: Container(
    decoration:const  BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        snapshot.data!.getImage,
        height: screenHeight * 0.2,
        fit: BoxFit.cover,
      ),
    ),
  ),
),
Positioned(
  left: screenWidth * 0.4,
  top: screenHeight * 0.1,
  child: SizedBox(
    width: screenWidth * 0.6,
    height: screenHeight * 0.1,
    child: AutoSizeText(
  
      snapshot.data!.getTitle,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 30,
        fontWeight: FontWeight.bold,

      ),
      maxFontSize: 30,
     overflow:TextOverflow.ellipsis
    ),
  ),
),

Positioned(left: screenWidth*0.4,top:screenHeight*0.16,child:Text("Type:",style:TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:20))) ,
Positioned(left: screenWidth*0.4,top:screenHeight*0.2,child:Text("Other names:",style:TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:20))),
Positioned(
  left: screenWidth * 0.4,
  top: screenHeight * 0.24,
  child: Container(
    width: screenWidth * 0.6,
    height: screenHeight * 0.1,
    child: AutoSizeText(
      snapshot.data!.getdiffName,
      style:const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 25,
        fontWeight: FontWeight.bold,

      ),
      
    ),
  ),
)
,
Positioned(
  left: screenWidth * 0.53,
  top: screenHeight * 0.16,
  child: AutoSizeText(
    snapshot.data!.getType,
    style: const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    maxFontSize: 20,
    minFontSize: 12,
  ),
),
  
Positioned(
  left: screenWidth * 0.02,
  top:screenHeight*0.35,
  child: Container(
    width: screenWidth * 0.4,
    height: screenHeight * 0.06,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 80, 80),
          Color.fromARGB(255, 255, 120, 120),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 213, 206, 206).withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: () {
        // Add your code here for the button's functionality
        Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoScreen(data:snapshot.data!.episodes,animeName:snapshot.data!.getTitle)));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:const Text(
        "WATCH NOW",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  ),
),
Positioned(
  left: screenWidth * 0.55,
  top:screenHeight*0.35,
  child: Container(
    width: screenWidth * 0.4,
    height: screenHeight * 0.06,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 80, 80),
          Color.fromARGB(255, 255, 120, 120),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 213, 206, 206).withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: () {
        // Add your code here for the button's functionality
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:const Text(
        "Favourite",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  ),
),
Positioned(left:screenWidth*0.05,top:screenHeight*0.43,child:const Text("Plot Summary:",style:TextStyle(fontSize:30,color: Color.fromARGB(255, 234, 140, 140),fontWeight: FontWeight.bold))), 
        ]
      ),
      ),
    const  SizedBox(height:5  ),
    Container(
      margin:const EdgeInsets.only(left:4),
      child:Expanded(child:  Text(snapshot.data!.plotSummary!=""?snapshot.data!.plotSummary: 'No data',style:const TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold))),
    )

              ]
        ))]
      
      );
 }
 else{
  return const Center(child:CircularProgressIndicator(color: Colors.white));
 }
      }
      
      ), ));
     
  }
}