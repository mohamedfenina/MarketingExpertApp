

class UserData {
  final String fullName;
  final String image;
  final bool status;
  final bool live;


  UserData(this.fullName, this.image, this.status, this.live);
}

List<UserData> personalInfoList = [
  UserData(
    'Enour Amine',
      "assets/images/amine.jpg",
      true,
    true
  ),

  UserData(
    'amine Nour',
      "assets/images/logo.jpg",
      true,
      true

  ),

  UserData(
      'lionel messi',
      "assets/images/amine.jpg",
      true,
      false

  ),
  UserData(
    'youssef romaine',
      "assets/images/logo.jpg",
      true,
      false

  ),

];
