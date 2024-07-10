import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'get_doc_id_image_state.dart';

class GetDocIDImageCubit extends Cubit<GetDocIDImageState> {
  static GetDocIDImageCubit get(context) => BlocProvider.of(context);

  GetDocIDImageCubit() : super(GetDocIDImageInitial());

  XFile? docIDImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    emit(GetDocIDImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        docIDImage = pickedFile;
        emit(GetDocIDImageSuccess());
      } else {
        emit(GetDocIDImageNotSelectedFailure());
      }
    } on Exception catch (e) {
      emit(GetDocIDImageFailure(failure: Failure.fromException(e)));
    }
  }
}
