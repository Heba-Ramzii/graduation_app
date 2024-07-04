part of 'ai_diagnosis_cubit.dart';

sealed class AiDiagnosisState {}

final class AiDiagnosisInitial extends AiDiagnosisState {}

final class AiDiagnosisPickImage extends AiDiagnosisState {}

final class AiDiagnosisLoadingState extends AiDiagnosisState {}

final class AiDiagnosisSuccessState extends AiDiagnosisState {
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
