import 'package:flutter/material.dart';
class FavouriteScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FavouriteScreenState();
  }
}
class FavouriteScreenState extends State<FavouriteScreen>{
  @override
  Widget build(BuildContext context) {
   return const  Center(
    child: Text("Favourite Page",style: TextStyle(fontSize: 40),),
   );
  }

}