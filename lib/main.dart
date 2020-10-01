import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'data.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final PageController _pageController = PageController();
  double _currentPage = 0;

  Timer _timer;
  int _start = 4;

  @override
  void initState() {
    _startTimer();
    _pageController.addListener((){
      _timer.cancel();
      _start = 4;
      _startTimer();
      setState(() => _currentPage = _pageController.page);
    });
    super.initState();
  }

  void _startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
          _pageController.animateToPage(_pageController.page == 2.0 ? 0 : _pageController.page.toInt()+1, duration: Duration(seconds:1), curve: Curves.ease);
          _start = 4;
          _startTimer();
        } else {
          _start = _start - 1;
          print('current time is $_start');
        }
      });
    });
  }

  void _launchURL(String urlAddress) async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming blog UI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionSubjectTitle('Programming Section'),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,6,12,12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: programmingSection.map((data) => _programSectionRowItem(data.imageName,data.title,data.subTitle,size)).toList()
              ),
            ),
            Container(
              width: size.width,
              height: 210,
              child: PageView(
                controller: _pageController,
                children: List<Widget>.generate(3,(index) => _featureItem('images/Feature${index+1}.png')).toList(),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 4,

                    ),
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey[800],height: 6,),
            _sectionSubjectTitle('Popular Materials'),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: popularMaterialsHorizontalList.map((data) => _popularMaterialsItem(data.imageName,data.title,data.subTitle)).toList()
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: normalMaterialsList.map((data) => _normalListItem(data.imageName,data.title,data.subTitle,size)).toList()
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(String imageName) => Image.asset(imageName,fit: BoxFit.fitWidth);

  Widget _sectionSubjectTitle(String subjectText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(subjectText,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
    );
  }

  Widget _normalListItem(String imageName,String title,String subTitle,Size size){
    return Card(
      elevation:2.0,
      child: Padding(
      padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,8,12,8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset('images/$imageName')
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:4.0,top:4.0),
                  child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Container(
                  width: size.width - 90,
                  child: Text(subTitle,style: TextStyle(fontSize: 14,color:Colors.grey[800]),maxLines: 1,)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _popularMaterialsItem(String imageName, String title,String subTitle){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(itemIcon,size:28),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 220,
              height: 120,
              child: Image.asset('images/$imageName',fit: BoxFit.fitWidth)
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,8.0,4,4),
            child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.teal[800]),),
          ),
          Container(
            width: 220,
            child: Text(subTitle,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black),maxLines: 1,)
          ),
        ],
      ),
    );
  }

  Widget _programSectionRowItem(String imageName, String title,String subTitle,Size size){
    return Card(
        elevation:1.0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(imageName == 'flutter_logo.png' ? 12 : 8.0),
                child: Container(
                  width: imageName == 'flutter_logo.png' ? 54 : 60,
                  height: imageName == 'flutter_logo.png' ? 54 : 60,
                  child: Image.asset('images/$imageName')
                ),
              ),
              Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          ),
        )
    );
  }
}
