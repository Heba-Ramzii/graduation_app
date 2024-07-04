import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/models/ai_model.dart';
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
      print(
          "//////////////////////fffffffffffffffffffailure///////////////////////");
      emit(AiDiagnosisErrorState(failure.errorMessage));
    }, (result) async {
      print("+++++++++++++++++++++++yyyyyyyyyyyyyyes++++++++++++++");
      print(result.doctorId);
      print(result.result);
      emit(AiDiagnosisSuccessState(result));
    });
  }

  Future<void> getAllDiagnosis() async {
    emit(GetLoadingState());
    var response = await aiRepoImp.get();
    response.fold((failure) {
      print(
          "//////////////////////fffffffffffffffffffailure///////////////////////");
      emit(GetErrorState(failure.errorMessage));
    }, (result) async {
      print("+++++++++++++++++++++++yyyyyyyyyyyyyyes++++++++++++++");
      emit(GetSuccessState(result));
    });
  }
}
