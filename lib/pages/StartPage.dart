import 'package:flutter/material.dart';
import 'package:note_buddy/pages/HomePage.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 9, 0, 40),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Container(
            
              
              height: 100,
              width: 100,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/img.png"))),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              
              height: 200,
              width: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/writing.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: 30,),
            Container( width: 300,
              child: Text("Your one stop spot to store all your Handwritten notes and categorize them easily with the help of our AI ",
              style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),textAlign: TextAlign.justify,)),
              SizedBox(height: 30,),
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF654597),Color(0xFFAB81CD)]),borderRadius: BorderRadius.circular(70)),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }, child: const Text("Get Started",style: TextStyle(color: Colors.white),))),
              
          ],
        
        ),
      ),
    );
  }
}