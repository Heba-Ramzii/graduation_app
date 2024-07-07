import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_state.dart';
import 'package:graduation_app/feature/patient/cubit/update_patient_cubit/update_patient_cubit.dart';
import 'package:graduation_app/feature/patient/layout/scedule/schedule_screen.dart';

import '../../../core/core_widgets/filter_row.dart';

class SearchPatientSceen extends StatefulWidget {
  const SearchPatientSceen({super.key});

  @override
  _SearchPatientSceenState createState() => _SearchPatientSceenState();
}

class _SearchPatientSceenState extends State<SearchPatientSceen> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  String? searchText;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorsManager.primaryLight3,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        actions: [
          SizedBox(
            child: Container(
              //width: 380,
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBar(
                onChanged: (String? value) {
                  searchText = value;
                  setState(() {});
                },
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                hintText: 'Search Doctor',
                leading: const Icon(Icons.search, color: ColorsManager.blue),
                trailing: Iterable<Widget>.generate(
                  1,
                  (index) => SvgPicture.asset(
                    'assets/icons/adjustments.svg',
                    color: ColorsManager.blue,
                    width: 24,
                    height: 24,
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: ColorsManager.homePageBackground,
      bottomNavigationBar: NavigationBar(
        height: 70,
        indicatorShape: const CircleBorder(
          eccentricity: 0.0,
        ),
        backgroundColor: ColorsManager.blue2,
        selectedIndex: 0,
        indicatorColor: ColorsManager.white,
        onDestinationSelected: (index) {},
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: ColorsManager.blue,
              width: 24, // Adjusted icon size
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/chat-alt.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/dots-horizontal.svg',
              color: ColorsManager.blue,
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterRow(
              filters: const [
                'All',
                'Top Doctor',
                'Favourite',
              ],
              onSelected: (index) {
                setState(() {
                  this.index = index;
                });
                print('Selected filter index: $index');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Builder(builder: (BuildContext context) {
              Widget body;
              switch (index) {
                case 0:
                  body = AllDoctorList(
                    search: searchText,
                  );
                  break;
                case 1:
                  body = const AllDoctorList();
                  break;
                case 2:
                  body = const FavouriteDoctorList();
                  break;

                default:
                  body = const SizedBox();
              }
              return body;
            })
            /* for (int i = 0; i < 4; i++) ...[
              SizedBox(
                height: 200,
                width:
                    MediaQuery.of(context).size.width * 0.9, // Adjusted width
                child: const BookCard(),
              ),
              const SizedBox(height: 10),
            ], */
          ],
        ),
      ),
    );
  }
}

class AllDoctorList extends StatelessWidget {
  const AllDoctorList({super.key, this.search});
  final String? search;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>>? stream = FirebaseFirestore.instance
        .collection('users')
        .where('isDoctor', isEqualTo: true)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Appointments Today !'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                DoctorModel doctorModel = DoctorModel.fromJson(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>);
                if (search != null) {
                  if (doctorModel.name!
                          .toLowerCase()
                          .contains(search!.toLowerCase()) ||
                      search!
                          .toLowerCase()
                          .contains(doctorModel.name!.toLowerCase())) {
                    return DoctorCard(
                      doctorModel: doctorModel,
                      favoriteDoctors: GetPatientCubit.get(context)
                          .patientModel!
                          .favoriteDoctors,
                    );
                  } else {
                    return const SizedBox();
                  }
                }
                return DoctorCard(
                  doctorModel: doctorModel,
                  favoriteDoctors: GetPatientCubit.get(context)
                      .patientModel!
                      .favoriteDoctors,
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
        });
  }
}

class FavouriteDoctorList extends StatelessWidget {
  const FavouriteDoctorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:
          GetPatientCubit.get(context).patientModel!.favoriteDoctors.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(GetPatientCubit.get(context)
                  .patientModel!
                  .favoriteDoctors[index])
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return DoctorCard(
                  favoriteDoctors: GetPatientCubit.get(context)
                      .patientModel!
                      .favoriteDoctors,
                  doctorModel: DoctorModel.fromJson(
                      snapshot.data!.data() as Map<String, dynamic>));
            }

            return const SizedBox();
          },
        );
      },
    );
  }
}

class DoctorCard extends StatefulWidget {
  final DoctorModel doctorModel;
  final List<String> favoriteDoctors;

  const DoctorCard(
      {Key? key, required this.doctorModel, required this.favoriteDoctors})
      : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          goTo(
              context,
              SchedualScreen(
                doctorModel: widget.doctorModel,
              ));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: StyleManager.containerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImage(
                    url: widget.doctorModel.imagePath, height: 70, width: 70),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorModel.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.doctorModel.speciality ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsManager.font,
                        ),
                      ),
                      const SizedBox(height: 10),
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: widget.doctorModel.rate ?? 0.0,
                        itemSize: 20,
                        itemCount: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorsManager.gold,
                        ),
                        onRatingUpdate: (value) {
                          print(value);
                        },
                      ),
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  if (widget.favoriteDoctors.contains(widget.doctorModel.id)) {
                    isFavorite = true;
                    return IconButton(
                      onPressed: () async {
                        GetPatientCubit.get(context)
                            .patientModel!
                            .favoriteDoctors
                            .remove(widget.doctorModel.id);
                        UpdatePatientCubit.get(context).updatePatient(
                            patientModel:
                                GetPatientCubit.get(context).patientModel!);
                        isFavorite = false;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: ColorsManager.blue,
                      ),
                    );
                  } else {
                    isFavorite = false;
                    return IconButton(
                      onPressed: () {
                        GetPatientCubit.get(context)
                            .patientModel!
                            .favoriteDoctors
                            .add(widget.doctorModel.id!);
                        UpdatePatientCubit.get(context).updatePatient(
                            patientModel:
                                GetPatientCubit.get(context).patientModel!);
                        isFavorite = true;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: ColorsManager.blue,
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
