class DiplomeModel {
  final String id;
  final String image;


  const DiplomeModel({
    required this.id,
    required this.image,

  });

  factory DiplomeModel.fromJson(Map<String, dynamic> json) => DiplomeModel(
    id: json['id'],
    image: json['image'],

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,

  };
}
