import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';

class FilterRow extends StatefulWidget {
  final List<String> filters;
  final ValueChanged<int> onSelected;
  final int initialIndex;

  FilterRow({
    required this.filters,
    required this.onSelected,
    this.initialIndex = 0,
  });

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Row(
      children: List.generate(widget.filters.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onSelected(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              color: _selectedIndex == index ? ColorsManager.primary : ColorsManager.fillter,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              widget.filters[index],
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : ColorsManager.primaryLight,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }
      ),
      ),
    );
  }
}
