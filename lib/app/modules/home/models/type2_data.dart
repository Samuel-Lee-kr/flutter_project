class Type2Data {
  Type2Data({
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

  static List<Type2Data> tabIconsList = <Type2Data>[
    Type2Data(
      imagePath: 'assets/images/breakfast.png',
      titleTxt: 'Breakfast',
      kacl: 525,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    Type2Data(
      imagePath: 'assets/images/lunch.png',
      titleTxt: 'Lunch',
      kacl: 602,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    Type2Data(
      imagePath: 'assets/images/snack.png',
      titleTxt: 'Snack',
      kacl: 0,
      meals: <String>['Recommend:', '800 kcal'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    Type2Data(
      imagePath: 'assets/images/dinner.png',
      titleTxt: 'Dinner',
      kacl: 0,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
