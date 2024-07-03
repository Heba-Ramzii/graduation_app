part of 'ai_diagnosis_cubit.dart';

sealed class AiDiagnosisState {}

final class AiDiagnosisInitial extends AiDiagnosisState {}

final class AiDiagnosisPickImage extends AiDiagnosisState {}

final class AiDiagnosisLoadingState extends AiDiagnosisState {}

final class AiDiagnosisSuccessState extends AiDiagnosisState {
  AiDiagnosisSuccessState(this.result);
  final String result;
}

final class AiDiagnosisErrorState extends AiDiagnosisState {
  AiDiagnosisErrorState(this.errorMessage);
  final String errorMessage;
}
