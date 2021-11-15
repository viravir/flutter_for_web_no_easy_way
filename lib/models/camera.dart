class CameraModel {
  final String id;
  final String name;

  CameraModel(this.id, this.name);

  CameraModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
