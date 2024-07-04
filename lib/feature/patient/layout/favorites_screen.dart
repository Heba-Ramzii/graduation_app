import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/filter_row.dart';

import '../widget/book_card.dart';

class FavoritesScreen  extends StatefulWidget {
  const FavoritesScreen ({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 0;

  final List<String> filters = [
    'All',
    'Male',
    'Female',
    'Top Rated',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Favorites",actionIcon:IconlyLight.search,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24.0),
        child: Column(
          children: [
            FilterRow(
                filters: filters,
                onSelected: (index) {
                setState(() {
                _selectedIndex = index;
                });
                },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => const  BookCard(),
                itemCount: 10,
              ),
            ),
          ],),
      ),
    );
  }
}
