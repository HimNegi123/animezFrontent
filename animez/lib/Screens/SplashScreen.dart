import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'SiginScreen.dart';
final player=AudioPlayer();
class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
Future<void> playSound() async {
 await player.play(AssetSource('logoSound.mp3'));
}
  @override
  void dispose() {
   player.dispose();
   super.dispose();
  }

  @override
  void initState() {
    super.initState();
    playSound();
    Timer(const Duration(seconds: 6)
    ,()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.gif',
              height: screenHeight * 0.1,
              width: screenWidth * 0.2,
            ),
            const SizedBox(height: 10),
            const Text(
              'Animez',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Pacifico',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
