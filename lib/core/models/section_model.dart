class SectionModel {
  SectionModel({required this.id, required this.sectionName});
  final int id;
  final String sectionName;

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      sectionName: json['section_name'],
    );
  }
}
