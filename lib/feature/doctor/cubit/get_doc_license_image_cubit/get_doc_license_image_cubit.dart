import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'get_doc_license_image_state.dart';

class GetDocLicenseImageCubit extends Cubit<GetDocLicenseImageState> {
  static GetDocLicenseImageCubit get(context) => BlocProvider.of(context);

  GetDocLicenseImageCubit() : super(GetDocLicenseImageInitial());

  XFile? docLicenseImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    emit(GetDocLicenseImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        docLicenseImage = pickedFile;
        emit(GetDocLicenseImageSuccess());
      } else {
        emit(GetDocLicenseImageNotSelectedFailure());
      }
    } on Exception catch (e) {
      emit(GetDocLicenseImageFailure(failure: Failure.fromException(e)));
    }
  }
}
