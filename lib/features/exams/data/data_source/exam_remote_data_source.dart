
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExamRemotDataSource {
  ExamRemotDataSource({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  final String examsTable = 'exams';
  Future<ExamModel> exam(
      {required ExamModel examModelToCreate}) async {
    await supabaseClient.from(examsTable).insert(
      {
        'exam_name': examModelToCreate.examName,
        'section_id':examModelToCreate.sectionId,
      },
    );

    final data = await supabaseClient
        .from(examsTable)
        .select()
        .eq('exam_name', examModelToCreate.examName)
        .single();
    return ExamModel.fromJson(data);
  }

 

  Future<void> deleteExam(
      {required ExamModel examModelToDelete}) async {
    await supabaseClient
        .from(examsTable)
        .delete()
        .eq('id', examModelToDelete.id);
  }

  

  Future<void> updateExam(
      {required ExamModel examModelToUpdate}) async {
    await supabaseClient.from(examsTable).update(
      {'exam_name': examModelToUpdate.examName},
    ).eq('id', examModelToUpdate.id);
  }


}
