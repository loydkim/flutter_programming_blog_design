class ProgrammingSection{
  final String imageName;
  final String title;
  final String subTitle;
  ProgrammingSection({this.imageName,this.title,this.subTitle});
}

List<ProgrammingSection> programmingSection = [
  new ProgrammingSection(imageName: 'flutter_logo.png',title: 'Flutter',subTitle: 'Cross'),
  new ProgrammingSection(imageName: 'ios_logo.png',title: 'iOS',subTitle: 'Swift'),
  new ProgrammingSection(imageName: 'android_logo.png',title: 'Android',subTitle: 'Kotlin'),
  new ProgrammingSection(imageName: 'diary_logo.png',title: 'ETC',subTitle: 'Diary'),
];

List<ProgrammingSection> popularMaterialsHorizontalList = [
  new ProgrammingSection(imageName: 'Feature1.png',title: 'Flutter',subTitle: 'Cross'),
  new ProgrammingSection(imageName: 'Feature2.png',title: 'iOS',subTitle: 'Swift'),
  new ProgrammingSection(imageName: 'Feature3.png',title: 'Android',subTitle: 'Kotlin'),
];