
import 'package:animez/Models/HomeScreenModel.dart';
import 'package:animez/RestApi/ApiDataCalling.dart';
import 'package:animez/Screens/SearchScreen.dart';
import 'package:animez/Screens/animeScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
   @override
  void dispose() {
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
    ApiDataCalling objectApi =ApiDataCalling();
    Future<List<List<HomeScreenModel>>> dataApi=objectApi.fechModel();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor:  Color.fromARGB(255, 22, 22, 23),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onSubmitted: (value) {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen(data:value)));
              },
            ),
          ),
          ),
          
          Container(
            margin: EdgeInsets.only(top: 20, left: 5),
            alignment: Alignment.topLeft,
            child: const Text(
              "Best Of This Week",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
   Container(
  height: screenHeight * 0.35,
  width: screenWidth * 0.95,
 
  child: FutureBuilder<List<List<HomeScreenModel>>>(
    future: dataApi,
    builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data![0].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                height: screenHeight * 0.35,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: 
                
                
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (() {
                         final String data= snapshot.data![0][index].animeUrl;
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimeScreen(data:data)));
                        }),
                        child:   Image.network(snapshot.data![0][index].imgUrl,
                    height: screenHeight * 0.30,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),

                  SizedBox(height:5),
                  Text(snapshot.data![0][index].title, style: const TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white),overflow:TextOverflow.ellipsis,)
                    ],
                  ) 
                ),
              ),
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }),
  ),
),
  Container(
            margin: EdgeInsets.only(top: 20, left: 5),
            alignment: Alignment.topLeft,
            child: const Text(
              "Most Popular",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
   Container(
  height: screenHeight * 0.35,
  width: screenWidth * 0.95,
 
  child: FutureBuilder<List<List<HomeScreenModel>>>(
    future: dataApi,
    builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data![0].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                height: screenHeight * 0.35,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child:InkWell(onTap:(){
  final String data= snapshot.data![1][index].animeUrl;
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimeScreen(data:data)));
                },child:ClipRRect(
                  
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
Image.network( snapshot.data![1][index].imgUrl,
                    height: screenHeight * 0.30,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height:5),
                  Text(snapshot.data![1][index].title, style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white),overflow:TextOverflow.ellipsis,)
                    ],
                  ) 
                ),)
               
              ),
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }),
  ),
),
     Container(
            margin: EdgeInsets.only(top: 20, left: 5),
            alignment: Alignment.topLeft,
            child: const Text(
              "Most Viewed of All Time",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
             Container(
  height: screenHeight * 0.35,
  width: screenWidth * 0.95,
 
  child: FutureBuilder<List<List<HomeScreenModel>>>(
    future: dataApi,
    builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data![2].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                height: screenHeight * 0.35,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(onTap:(() {
                  final String data= snapshot.data![2][index].animeUrl;
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimeScreen(data:data)));
                }),child:ClipRRect(
                  
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
Image.network(    snapshot.data![2][index].imgUrl,
                    height: screenHeight * 0.30,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height:5),
                  Text(snapshot.data![1][index].title, style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white),overflow:TextOverflow.ellipsis,)
                    ],
                  ) 
                ),)
                
           
              ),
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }),
  ),
),
        ],
      ),
      )
       
    );
  }
}
