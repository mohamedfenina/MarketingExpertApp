class GalleryModel {
  final String id;
  final String image;
  final String like;
  final bool premium;

  const GalleryModel({

    required this.id,
    required this.image,
    required this.like,
    required this.premium,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        image: json['image'],
        like: json['like'],
    premium: json['premium'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'like': like,
    'premium': premium,
      };
}
