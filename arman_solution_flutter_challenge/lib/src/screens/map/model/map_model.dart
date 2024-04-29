class MapModel {
  final String title;
  final int id;

  MapModel({required this.title, required this.id});

  factory MapModel.fromJson(final Map<String, dynamic> json) => MapModel(
        title: json['title'],
        id: json['id'],
      );
}
