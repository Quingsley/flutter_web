class WelcomePageModel {
  final String name;
  final String title;
  final String subTitle;
  final String imgPath;
  final List<String> greetings;

  WelcomePageModel({
    required this.title,
    required this.subTitle,
    required this.imgPath,
    required this.greetings,
    required this.name,
  });

  factory WelcomePageModel.fromDatabase(Map<String, dynamic> doc) {
    return WelcomePageModel(
      title: doc['title'],
      subTitle: doc['subtitle'],
      imgPath: doc['imgPath'],
      greetings:
          (doc['greetings'] as List<dynamic>).map((e) => e.toString()).toList(),
      name: doc['name'],
    );
  }
}
