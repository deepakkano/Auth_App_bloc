import 'package:api_login_signup/login.dart';
import 'package:api_login_signup/signup.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var styletext=TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:  Column(
          children: [
                       Image.asset("assets/images/SplashScreenImage.png",height: 350,),
                       Text("Discover Your",style:styletext,),
                       Text("Dream Job Here",style: styletext,),
                       Text("Explore Your Dream Job base on Your Interest"),
Padding(
  padding: const EdgeInsets.all(40),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
      width: 150,
      height: 50,
        child: ElevatedButton(onPressed: (){




          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreenState()),
            );
        }, child: 
        Text("Login",style: TextStyle(color: Colors.white),)
        ,style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 43, 116),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
              ),),
      ), Container(
      width: 150,
      height: 50,
        child: ElevatedButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );}, child: 
        Text("Register",style: TextStyle(color: Colors.white),)
        ,style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 43, 116),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
              ),),
      )
  
    ],
  ),
)

          ],
        ),
      ),
    );
  }
}