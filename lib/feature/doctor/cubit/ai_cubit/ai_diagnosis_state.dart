
import 'package:graduation_app/feature/doctor/data/models/ai_model.dart';

abstract class AiDiagnosisState {}

class AiDiagnosisInitial extends AiDiagnosisState {}

class AiDiagnosisPickImage extends AiDiagnosisState {}

class AiDiagnosisLoadingState extends AiDiagnosisState {}

class AiDiagnosisSuccessState extends AiDiagnosisState {
  AiDiagnosisSuccessState(this.result);
  final AIModel result;
}

final class AiDiagnosisErrorState extends AiDiagnosisState {
  AiDiagnosisErrorState(this.errorMessage);
  final String errorMessage;
}

final class GetLoadingState extends AiDiagnosisState {}

final class GetSuccessState extends AiDiagnosisState {
  GetSuccessState(this.result);
  final List<AIModel> result;
}

final class GetErrorState extends AiDiagnosisState {
  GetErrorState(this.errorMessage);
  final String errorMessage;
}
