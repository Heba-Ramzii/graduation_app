import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'get_patient_image_state.dart';

class GetPatientImageCubit extends Cubit<GetPatientImageState> {
  static GetPatientImageCubit get(context) => BlocProvider.of(context);

  GetPatientImageCubit() : super(GetPatientImageInitial());

  XFile? image;
  var picker = ImagePicker();

  Future<void> getImage() async {
    emit(GetPatientImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = pickedFile;
        emit(GetPatientImageSuccess());
      } else {
        emit(GetPatientImageNotSelectedFailure());
      }
    } on Exception catch (e) {
      emit(GetPatientImageFailure(failure: Failure.fromException(e)));
    }
  }
}
