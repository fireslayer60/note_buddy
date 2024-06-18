import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:note_buddy/components/db.dart';

class MathPage extends StatefulWidget {
 

  const MathPage({Key? key, }) : super(key: key);

  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 0, 40),
      appBar: AppBar(
        backgroundColor: Color(0xFF654597),
        title: Text('Maths Notes'),
      ),
      body: ListView.builder(
        itemCount: mathimg.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image enlargement here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MathImageDetailPage(image: mathimg[index],info:mathinfo[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.file(
                    mathimg[index],
                    width: 400, // Initial width
                    height: 100, // Initial height
                    fit: BoxFit.cover,
                  ),
                  Text(mathinfo[index][0],style: TextStyle(fontSize: 18,color: Colors.white),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MathImageDetailPage extends StatefulWidget {
  final File image;
  final List<String> info;

  const MathImageDetailPage({Key? key, required this.image, required this.info}) : super(key: key);

  @override
  _MathImageDetailPageState createState() => _MathImageDetailPageState();
}

class _MathImageDetailPageState extends State<MathImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    String topic =widget.info[0];
    String link =widget.info[1];
    String text =widget.info[2];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 0, 40),
      appBar: AppBar(
        backgroundColor: Color(0xFF654597),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Image.file(
                  widget.image,
                  // Adjust width and height as needed for enlargement
                  width: MediaQuery.of(context).size.width-20,
                  height: MediaQuery.of(context).size.height-200,
                  fit: BoxFit.fill,
                ),
                Text("Topic : $topic",style:TextStyle(color: Colors.white)),
                Text("Text : $text",style:TextStyle(color: Colors.white)),
                Text("Related Link : $link",style:TextStyle(color: Colors.white)),
                QrImageView(
                            data: link,
                            version: QrVersions.auto,
                            size: 100.0,
                            backgroundColor: Colors.white,
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
