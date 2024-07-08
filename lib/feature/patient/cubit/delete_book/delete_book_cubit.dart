import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/patient/cubit/delete_book/delete_book_state.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';


class DeleteBookCubit extends Cubit<DeleteBookState> {
  final PatientRepoImp patientRepoImp;
  static DeleteBookCubit get(context) => BlocProvider.of(context);

  DeleteBookCubit(this.patientRepoImp) : super(DeleteBookInitial());
  void deleteBook(PatientBookModel patientBookModel) async {
    emit(DeleteBookLoading());
    final result = await patientRepoImp.deleteBook(patientBookModel: patientBookModel);
    result.fold((l) => emit(DeleteBookFailed(l)), (r) {
      emit(DeleteBookSuccess());
    });
  }
}
