import 'package:admin_quiz/core/models/question_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuestionRemoteDataSource {
  QuestionRemoteDataSource({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  final String questionsTable = 'questions';

  Future<QuestionModel> addQuestion(
      {required QuestionModel questionModelToCreate}) async {
    await supabaseClient.from(questionsTable).insert(
      {
        'exam_id': questionModelToCreate.examId,
        'question_text': questionModelToCreate.questionText,
        'choices': questionModelToCreate.choices,
        'correct_answer': questionModelToCreate.correctAnswer
      },
    );

    final response = await supabaseClient
        .from(questionsTable)
        .select()
        .eq('question_text', questionModelToCreate.questionText)
        .single();
    return QuestionModel.fromJson(response);
  }

  Future<void> deleteQuestion(
      {required QuestionModel questionModelToDelete}) async {
    await supabaseClient
        .from(questionsTable)
        .delete()
        .eq('id', questionModelToDelete.id);
  }

  Future<void> updateQuestion(
      {required QuestionModel editedQuestionModel}) async {
    await supabaseClient.from(questionsTable).update(
      {
        'question_text': editedQuestionModel.questionText,
        'choices': editedQuestionModel.choices,
        'correct_answer': editedQuestionModel.correctAnswer
      },
    ).eq(
      'id',
      editedQuestionModel.id,
    );
  }
}
