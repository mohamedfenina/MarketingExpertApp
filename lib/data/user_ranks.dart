

class UserRanks {
  final String fullName;
  final String image;
  final int followers;



  UserRanks(this.fullName, this.image, this.followers);
}

List<UserRanks> ranksList = [
  UserRanks(
      'Amine Ennour',
      "assets/images/amine.jpg",
      1200
  ),

  UserRanks(
      'Ennour amine',
      "assets/images/amine.jpg",
      150
  ),

  UserRanks(
      'test test',
      'assets/images/logo.jpg',
      320
  ),

  UserRanks(
      'leo messi',
      'assets/images/logo.jpg',
      3
  ),

];
