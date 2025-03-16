import 'package:admin_quiz/features/home/data/models/all_data_model.dart';

abstract class FetchAllDataState {}

class FetchAllDataInitialState extends FetchAllDataState {}

class FetchAllDataLoadingState extends FetchAllDataState {}

class FetchAllDataSuccessState extends FetchAllDataState {
  final AllDataModel allDataModel;
  FetchAllDataSuccessState({required this.allDataModel});
}

class FetchAllDataFailureState extends FetchAllDataState {
  final String errMessage;

  FetchAllDataFailureState({required this.errMessage});
}
