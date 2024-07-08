import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/feature/patient/cubit/add_new_clinic_booking/add_new_clinic_booking_state.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/data/repo/patient_repo/patient_repo_imp.dart';


class AddNewClinicBookingCubit extends Cubit<AddNewClinicBookingState> {
  final PatientRepoImp patientRepoImp;
  static AddNewClinicBookingCubit get(context) => BlocProvider.of(context);

  AddNewClinicBookingCubit(this.patientRepoImp) : super(AddNewClinicBookingInitial());
  void addNewBook({required BookModel bookModel, required PatientBookModel patientBookModel}) async {
    emit(AddNewClinicBookingLoading());
    final result = await patientRepoImp.addNewClinicBooking(bookModel: bookModel, patientBookModel: patientBookModel);
    result.fold((l) => emit(AddNewClinicBookingFailed(l)), (r) {
      emit(AddNewClinicBookingSuccess());
    });
  }
}
