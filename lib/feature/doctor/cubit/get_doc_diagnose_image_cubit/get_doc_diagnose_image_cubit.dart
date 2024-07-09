import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'get_doc_diagnose_image_state.dart';

class GetDocDiagnoseImageCubit extends Cubit<GetDocDiagnoseImageState> {
  static GetDocDiagnoseImageCubit get(context) => BlocProvider.of(context);

  GetDocDiagnoseImageCubit() : super(GetDocDiagnoseImageInitial());

  XFile? diagnoseImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    emit(GetDocDiagnoseImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        diagnoseImage = pickedFile;
        emit(GetDocDiagnoseImageSuccess());
      } else {
        emit(GetDocDiagnoseImageNotSelectedFailure());
      }
    } on Exception catch (e) {
      emit(GetDocDiagnoseImageFailure(failure: Failure.fromException(e)));
    }
  }
}
