import 'dart:io';

import 'package:flutter/material.dart';


class SubButton extends StatefulWidget {
  final ImageProvider<Object> image;
  final String text;
  final List<File> files;


  const SubButton({Key? key, required this.image, required this.text,required this.files}) : super(key: key);

  @override
  State<SubButton> createState() => _SubButtonState();
}

class _SubButtonState extends State<SubButton> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 260,
      width: 170,
      child: Stack(
        children: [
          Container(
            height: 260,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            height: 140,
            width: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE2ADF2).withOpacity(0),
                  Color(0xFFAB81CD).withOpacity(0.5),
                  Color(0xFF654597).withOpacity(1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 10,
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Container(
              width: 120,
              child: Text(
                "You have "+widget.files.length.toString()+" notes in "+widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

