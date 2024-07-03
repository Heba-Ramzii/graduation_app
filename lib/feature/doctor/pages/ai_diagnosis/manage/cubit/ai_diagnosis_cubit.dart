import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/repo/ai_repo_imp.dart';
import 'package:image_picker/image_picker.dart';

part 'ai_diagnosis_state.dart';

class AiDiagnosisCubit extends Cubit<AiDiagnosisState> {
  AiDiagnosisCubit(this.aiRepoImp) : super(AiDiagnosisInitial());
  final AiRepoImp aiRepoImp;
  static AiDiagnosisCubit get(context) => BlocProvider.of(context);

  File? image;
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(AiDiagnosisPickImage());
    }
  }

  Future<void> aiDiagnosis({
    required int doctorId,
  }) async {
    emit(AiDiagnosisLoadingState());
    var response = await aiRepoImp.aiDiagnosis(
      image: image!,
      doctorId: doctorId,
    );
    response.fold((failure) {
      emit(AiDiagnosisErrorState(failure.errorMessage));
    }, (result) async {
      emit(AiDiagnosisSuccessState(result));
    });
  }
}
