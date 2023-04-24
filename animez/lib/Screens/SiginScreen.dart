import 'dart:ui';
import 'package:animez/Screens/LogInScreen.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _nameController = TextEditingController();
void initState() {
  super.initState();
  _animationController = AnimationController(
    vsync: this,
    duration:const Duration(milliseconds: 100),
  );
}

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text('HEY THERE !',style: TextStyle(fontSize:screenHeight*0.05,fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
    const  SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
   const   SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              // Perform sign-in action
              String email = _emailController.text;
              String password = _passwordController.text;
              print('Sign in with email: $email and password: $password');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
            },
          
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 243, 107, 33),
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
              
          ),
          const SizedBox(height: 10),
           const Text('OR',style: TextStyle(fontSize:30),),
          GestureDetector(
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen())),
            child: const Text('Log In',style: TextStyle(fontSize: 20,color: Colors.blue),),
          )     
        ],
      ),
    );
  }
}
