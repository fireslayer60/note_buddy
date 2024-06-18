import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:note_buddy/components/SubButton.dart';
import 'package:note_buddy/components/db.dart';
import 'package:note_buddy/pages/ChemPage.dart';
import 'package:note_buddy/pages/MathPage.dart';
import 'package:note_buddy/pages/PhyPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? _image;

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Call function to send image to backend
        sendImageToBackend();
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> sendImageToBackend() async {
    if (_image == null) return;

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:5000/predict'));

    // Add the image file to the request
    var imageFile = await http.MultipartFile.fromPath('file',_image!.path);
    request.files.add(imageFile);

    // Send the request
    var response = await request.send();

    // Read the response from the server
    var responseText = await response.stream.bytesToString();

      
        final List<dynamic> responseData = jsonDecode(responseText);
        print('Predicted topics:');
        print(responseData);
        for (String key in responseData[0]['links'].keys){
          choice = key;
        }
        print(choice);
        if (choice == 'Physics'){
          phyinfo.add([responseData[0]['topic'],responseData[0]['links'][choice],responseData[0]['text']]);
          phyimg.add(_image!);
        }
        else if (choice == 'Chemistry'){
          cheminfo.add([responseData[0]['topic'],responseData[0]['links'][choice],responseData[0]['text']]);
          chemimg.add(_image!);
        }
        else{
          mathinfo.add([responseData[0]['topic'],responseData[0]['links'][choice],responseData[0]['text']]);
          mathimg.add(_image!);
        }
      
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 0, 40),
        appBar: AppBar(
          backgroundColor: Color(0xFF654597),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/img.png"), fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  Search ...',
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                "My Notes:",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PhyPage()));
                    },
                    child: SubButton(
                      image: AssetImage("lib/images/phy.jpg"),
                      text: "Physics",
                      files: phyimg,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChemPage()));
                    },
                    child: SubButton(
                      image: AssetImage("lib/images/chem.jpg"),
                      text: "Chemistry",
                      files:chemimg
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MathPage()));
                    },
                    child: SubButton(
                      image: AssetImage("lib/images/math.jpg"),
                      text: "Maths",
                      files:mathimg
                    ),
                  ),
                  SubButton(
                    image: AssetImage("lib/images/other.png"),
                    text: "Others",
                    files:[]
                  ),
                ],
              ),
              IconButton(
                onPressed: getImage,
                splashColor: Color(0xFF574AE2),
                splashRadius: 20,
                icon: Icon(Icons.camera_alt_rounded),
                color: Color(0xFF574AE2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
