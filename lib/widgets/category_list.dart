import 'package:expensivetracker/utils/icons_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.onChanged});
  final ValueChanged<String?> onChanged;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String currentCategory = "";
  List<Map<String, dynamic>> categorylist = [];

  var appIcons = AppIcons();
  var addCat = {
    "name": "All",
    "icon": FontAwesomeIcons.cartPlus,
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      categorylist = appIcons.homeExpensesCategories;
      categorylist.insert(0, addCat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorylist.map((data) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentCategory = data['name'];
                widget.onChanged(data['name']);
              });
            },
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: currentCategory == data['name']
                    ? Color(0XFFFFB703)
                    : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(data['icon'], size: 15, color: currentCategory == data['name'] ? Colors.white : Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    data['name'],
                    style: TextStyle(
                      color: currentCategory == data['name'] ? Colors.white : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
