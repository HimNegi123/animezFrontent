import 'package:animez/Models/SearchScreenModel.dart';
import 'package:animez/RestApi/ApiDataCalling.dart';
import 'package:animez/Screens/AnimeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  final String data;

  const SearchScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchScreenState(data);
  }
}

class SearchScreenState extends State<SearchScreen> {
  final String name;

  SearchScreenState(this.name);
     @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 22, 23),
        body: FutureBuilder<List<SearchScreenModel>>(
            future: ApiDataCalling().searchApi(name),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 10, top: screenHeight * 0.05),
                      child: Text(
                        "Search results for: $name",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            
                    Container(
                      height: screenHeight * 0.88,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 22, 22, 23)),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return InkWell(onTap: () async{
                          final String data= snapshot.data![index].animeUrl;
                          ApiDataCalling().animeApi(data);
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimeScreen(data: data)));
                          },child:   Card(
                          
                            color: Color.fromARGB(255, 10, 10, 10),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: screenHeight*0.2, // set the height to your desired value
        width: screenWidth*0.4, // set the width to your desired value
        child: Image.network(
          snapshot.data![index].imgUrl,
          fit: BoxFit.cover,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index+1}.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 235, 230, 230),
                ),
              ),
              SizedBox(height: 8),
              Text(
                snapshot.data![index].title,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 235, 230, 230),overflow:TextOverflow.ellipsis
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
));
                        

                        }),
                      ),
                    )
                  ],
                );
              }else {
                return
                ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.blueGrey[800]!,
          highlightColor: Colors.blueGrey[700]!,
          period: Duration(milliseconds: 800),
          child: Card(
            color: Colors.blueGrey[900],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, 
                    color: Colors.blueGrey[800],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: double.infinity,
                          color: Colors.blueGrey[700],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: Colors.blueGrey[800],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: Colors.blueGrey[700],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
            })
  ));
  }}
