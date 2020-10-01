class ProgrammingSection{
  final String imageName;
  final String title;
  final String subTitle;
  ProgrammingSection({this.imageName,this.title,this.subTitle});
}

List<ProgrammingSection> programmingSection = [
  new ProgrammingSection(imageName: 'flutter_logo.png',title: 'Flutter',subTitle: 'Cross'),
  new ProgrammingSection(imageName: 'apple.png',title: 'iOS',subTitle: 'Swift'),
  new ProgrammingSection(imageName: 'android.png',title: 'Android',subTitle: 'Kotlin'),
  new ProgrammingSection(imageName: 'diary.png',title: 'Diary',subTitle: 'Diary'),
];

List<ProgrammingSection> popularMaterialsHorizontalList = [
  new ProgrammingSection(imageName: 'popular1.png',title: 'Diary - Express Entry',subTitle: 'Calculate Express Entry Score'),
  new ProgrammingSection(imageName: 'popular2.jpg',title: 'Swift - RESTful API',subTitle: 'REST API with JSON'),
  new ProgrammingSection(imageName: 'popular3.png',title: 'Flutter - Authentication',subTitle: 'Phone, Facebook, AppID'),
  new ProgrammingSection(imageName: 'popular4.jpg',title: 'Flutter - Animation',subTitle: 'Animation Effects'),
];

List<ProgrammingSection> normalMaterialsList = [
  new ProgrammingSection(imageName: 'normal1.png',title: 'Chat App',subTitle: 'Realtime, Badge count, Send an image'),
  new ProgrammingSection(imageName: 'normal2.png',title: 'In-app Purchase',subTitle: 'Make a money from App'),
  new ProgrammingSection(imageName: 'normal3.png',title: 'Authentication',subTitle: 'Sign in, Sign up'),
  new ProgrammingSection(imageName: 'normal4.png',title: 'Push Notification',subTitle: 'APNs, local Notification'),
  new ProgrammingSection(imageName: 'normal5.png',title: 'Release App',subTitle: 'Upload app to Store'),
];