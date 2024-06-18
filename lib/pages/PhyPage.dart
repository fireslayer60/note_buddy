import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:note_buddy/components/db.dart';

class PhyPage extends StatefulWidget {
 

  const PhyPage({Key? key, }) : super(key: key);

  @override
  _PhyPageState createState() => _PhyPageState();
}

class _PhyPageState extends State<PhyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 0, 40),
      appBar: AppBar(
        backgroundColor: Color(0xFF654597),
        title: Text('Physics Notes'),
      ),
      body: ListView.builder(
        itemCount: phyimg.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image enlargement here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhyImageDetailPage(image: phyimg[index],info:phyinfo[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.file(
                    phyimg[index],
                    width: 400, // Initial width
                    height: 100, // Initial height
                    fit: BoxFit.cover,
                  ),
                  Text(phyinfo[index][0],style: TextStyle(fontSize: 18,color: Colors.white),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhyImageDetailPage extends StatefulWidget {
  final File image;
  final List<String> info;

  const PhyImageDetailPage({Key? key, required this.image, required this.info}) : super(key: key);

  @override
  _PhyImageDetailPageState createState() => _PhyImageDetailPageState();
}

class _PhyImageDetailPageState extends State<PhyImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    String topic =widget.info[0];
    String link =widget.info[1];
    String text =widget.info[2];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 0, 40),
      appBar: AppBar(backgroundColor: Color(0xFF654597),),
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
