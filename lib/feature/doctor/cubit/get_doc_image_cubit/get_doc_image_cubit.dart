import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'get_doc_image_state.dart';

class GetDocImageCubit extends Cubit<GetDocImageState> {
  static GetDocImageCubit get(context) => BlocProvider.of(context);

  GetDocImageCubit() : super(GetDocImageInitial());

  XFile? image;
  var picker = ImagePicker();

  Future<void> getImage() async {
    emit(GetDocImageLoading());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = pickedFile;
        emit(GetDocImageSuccess());
      } else {
        emit(GetDocImageNotSelectedFailure());
      }
    } on Exception catch (e) {
      emit(GetDocImageFailure(failure: Failure.fromException(e)));
    }
  }
}
