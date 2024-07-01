import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_state.dart';
import 'package:image_picker/image_picker.dart';



class GetClinicImageCubit extends Cubit<GetClinicImageState> {
  static GetClinicImageCubit get(context) => BlocProvider.of(context);

  GetClinicImageCubit() : super(GetClinicImageInitial());

  XFile? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    emit(GetClinicImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = pickedFile;
        emit(GetClinicImageSuccess());
      } else {
        emit(GetClinicImageNotSelectedFailure());
      }
    }
    on Exception catch (e) {
      emit(GetClinicImageFailure(failure: Failure.fromException(e)));
    }
  }
}
