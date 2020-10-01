import 'package:flutter/material.dart';

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

  @override
  void initState() {
    _pageController.addListener((){
      setState(() => _currentPage = _pageController.page);
    });
    super.initState();
  }

  Widget _pageViewIndicator(int location) {
    return Padding(
      padding: const EdgeInsets.only(right:6.0,left:6),
      child: Icon(Icons.lens,size: 14,color: location - 1 <= _currentPage&& _currentPage < location ? Colors.blue[900] : Colors.grey[600]),
    );
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List<Widget>.generate(3,(index) => _pageViewIndicator(index+1)).toList(),
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
            _normalListItem('flutter_logo.png','Flutter','it is awesome',size),
            _normalListItem('ios_logo.png','iOS','anvakjsdnvafjkshdvfahsduhfundviunivnsuadfvasndhvfahsudhfasdhfuvasv',size),
            _normalListItem('android_logo.png','Android','it is awesome',size),
            _normalListItem('diary_logo.png','Diary','it is awesome',size),
            _normalListItem('flutter_logo.png','Flutter','it is awesome',size),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(String imageName){
    return Image.asset(imageName,fit: BoxFit.fitWidth,);
  }

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
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('images/$imageName')
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Container(
                  width: size.width - 90,
                  child: Text(subTitle,style: TextStyle(fontSize: 14,color:Colors.grey[800]),maxLines: 2,)
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
            child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Text(subTitle),
        ],
      ),
    );
  }

  Widget _programSectionRowItem(String imageName, String title,String subTitle,Size size){
    return Card(
        elevation:2.0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              // Icon(itemIcon,size:28),
              Padding(
                padding: EdgeInsets.all(imageName == 'flutter_logo.png' ? 12 : 8.0),
                child: Container(
                  width: imageName == 'flutter_logo.png' ? 54 : 60,
                  height: imageName == 'flutter_logo.png' ? 54 : 60,
                  child: Image.asset('images/$imageName')
                ),
              ),
              Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(subTitle),
              ),
            ],
          ),
        )
    );
  }
}
