import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_state.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';


class AddClinic extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  //appointment
  final dayController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();

  AddClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "Add Appointment",
        actionIcon: Icons.done_rounded,
        actionTap: (){

        },
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius:StyleManager.borderRadius,
                ),
                child: Center(
                  child: Column(
                    children: [

                     BlocConsumer<GetClinicImageCubit,GetClinicImageState>(
                      listener: (context, state){

                      },
                       builder: (context, state){
                        return  Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.white,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      image:
                                      GetClinicImageCubit.get(context).profileImage == null
                                          ? const AssetImage("assets/images/Logo.png")
                                          : FileImage(File(GetClinicImageCubit.get(context).profileImage!.path))
                                      as ImageProvider,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),

                            CircleAvatar(
                              backgroundColor: Colors.purple,
                              radius: 20,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  GetClinicImageCubit.get(context).getProfileImage();
                                },
                              ),
                            )
                          ],
                        );
                       }),
                      EditInfoRow(
                        title: "Name",
                        controller: nameController,
                        inputType: TextInputType.name,
                      ),
                      EditInfoRow(
                        title: "Phone",
                        controller: phoneController,
                        inputType: TextInputType.phone,
                      ),
                      EditInfoRow(
                        title: "Address",
                        controller: addressController,
                        inputType: TextInputType.streetAddress,
                      ),
                      EditInfoRow(
                        title: "Description",
                        controller: descriptionController,
                        inputType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Appointments",
                  style: StyleManager.mainTextStyle15.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                padding:  const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius:StyleManager.borderRadius,
                ),
                child: Column(
                  children: [
                    EditInfoRow(
                      readOnly: true,
                      title: "Day",
                      controller: dayController,
                      inputType: TextInputType.text,
                      onTap: () {
                        //todooo
                      },
                      icon: Icons.keyboard_arrow_down_rounded,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditInfoRow(
                            title: "From",
                            controller: fromController,
                            inputType: TextInputType.text,
                            onTap: () {

                            },
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: EditInfoRow(
                            title: "To",
                            controller: toController,
                            inputType: TextInputType.text,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
