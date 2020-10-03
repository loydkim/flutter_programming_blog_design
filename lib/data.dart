import 'package:flutter/material.dart';

class ProgrammingSection{
  final String imageName;
  final String title;
  final String subTitle;
  final String url;
  final Color highlightColor;
  ProgrammingSection({this.imageName,this.title,this.subTitle,this.url,this.highlightColor});
}

List<ProgrammingSection> programmingSection = [
  new ProgrammingSection(imageName: 'flutter_logo.png',title: 'Flutter',subTitle: 'Cross',highlightColor: Colors.yellow),
  new ProgrammingSection(imageName: 'apple.png',title: 'iOS',subTitle: 'Swift',highlightColor: Colors.lightGreenAccent),
  new ProgrammingSection(imageName: 'android.png',title: 'Android',subTitle: 'Kotlin',highlightColor: Colors.purpleAccent),
  new ProgrammingSection(imageName: 'diary.png',title: 'Diary',subTitle: 'Diary',highlightColor: Colors.orangeAccent),
];

List<ProgrammingSection> featureSection = [
  new ProgrammingSection(imageName: 'Feature1.png',url:'https://youtu.be/EtzfZLjBgJk'),
  new ProgrammingSection(imageName: 'Feature2.png',url:'https://youtu.be/8Zog36SAEDc'),
  new ProgrammingSection(imageName: 'Feature3.png',url:'https://loydlab.blogspot.com/2018/06/programming-diary-celpip-tip.html'),
];

List<ProgrammingSection> popularMaterialsHorizontalList = [
  new ProgrammingSection(imageName: 'popular1.png',title: 'Diary - Express Entry',subTitle: 'Calculate Express Entry Score',url: 'https://loydlab.blogspot.com/2018/06/programming-diary-express-entry.html'),
  new ProgrammingSection(imageName: 'popular2.jpg',title: 'Swift - RESTful API',subTitle: 'REST API with JSON',url:'https://youtu.be/ULScC0TmDlc'),
  new ProgrammingSection(imageName: 'popular3.png',title: 'Flutter - Authentication',subTitle: 'Phone, Facebook, AppID',url: 'https://youtu.be/Lg2asOUs5os'),
  new ProgrammingSection(imageName: 'popular4.jpg',title: 'Flutter - Animation',subTitle: 'Animation Effects',url:'https://youtu.be/WgQ8kgGLU3I'),
];

List<ProgrammingSection> normalMaterialsList = [
  new ProgrammingSection(imageName: 'normal1.png',title: 'Chat App',subTitle: 'Realtime, Badge count, Send an image',url:'https://youtu.be/OnIRKAbOcq4'),
  new ProgrammingSection(imageName: 'normal2.png',title: 'In-app Purchase',subTitle: 'Make a money from App',url:'https://youtu.be/p3kUPVhVaL4'),
  new ProgrammingSection(imageName: 'normal3.png',title: 'Authentication',subTitle: 'Sign in, Sign up',url:'https://youtu.be/48meWFwi-6g'),
  new ProgrammingSection(imageName: 'normal4.png',title: 'Push Notification',subTitle: 'APNs, local Notification',url:'https://youtu.be/P8Y84OnVkdg'),
  new ProgrammingSection(imageName: 'normal5.png',title: 'Release App',subTitle: 'Upload app to Store',url:'https://youtu.be/VCbfqTpkOTA'),
];