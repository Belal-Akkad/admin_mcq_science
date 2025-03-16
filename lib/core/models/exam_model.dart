class ExamModel {
  final int id;
  final int sectionId;
  final String examName;

  ExamModel(
      {required this.id, required this.examName, required this.sectionId});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'],
      examName: json['exam_name'],
      sectionId: json['section_id'],
    );
  }
}
