import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_state.dart';
import 'package:graduation_app/feature/patient/widget/more/patient_options_column.dart';

import '../../../../core/theme_manager/style_manager.dart';

class PatientMoreScreen extends StatelessWidget {
  const PatientMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            BlocConsumer<GetPatientCubit,GetPatientState>(
              listener: (context, state) {

              },
              builder: (context, state) {
              if(state is GetPatientSuccess)  {
                return Column(
                  children: [
                     ProfileImage(
                      height: 100,
                      width: 100,
                      size: 100,
                      url: state.patientModel.imagePath,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Text(
                        state.patientModel.name ?? '',
                        style: StyleManager.textStyle14
                            .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
              },
              ),
            const PatientOptionsColumn(),
          ],
        ),
      ),
    );
  }
}
