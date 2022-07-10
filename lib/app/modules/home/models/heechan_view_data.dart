class HType2Data {
  HType2Data({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<HType2Data> tabIconsList = <HType2Data>[
    HType2Data(
      imagePath: 'assets/images/breakfast.png',
      titleTxt: '조식',
      kacl: 525,
      meals: <String>['밥22,', '느타리버섯국,', '호박쇠고기볶음,', '두부조림,', '깍두기', '스트링치즈'],
      startColor: '#7de83a',
      endColor: '#536349',
    ),
    HType2Data(
      imagePath: 'assets/images/lunch.png',
      titleTxt: '중식',
      kacl: 602,
      meals: <String>['밥,', '느타리버섯국,', '호박쇠고기볶음,', '두부조림,', '깍두기', '스트링치즈'],
      startColor: '#f7f131',
      endColor: '#8f8b10',
    ),
    HType2Data(
      imagePath: 'assets/images/dinner.png',
      titleTxt: '석식',
      kacl: 333,
      meals: <String>['밥,', '느타리버섯국,', '호박쇠고기볶음,', '두부조림,', '깍두기', '스트링치즈'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
