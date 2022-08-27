import 'package:flutter/material.dart';
import 'package:food07/dumy_lists/dummy_list.dart';
import 'package:food07/screens/cat_items.dart';

class categoryScreen extends StatefulWidget {

  @override
  _categoryScreenState createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(15.0),
        children: DUMMY_CATEGORIES.map((catItem) => Items(catItem.id,
            catItem.title,
            catItem.color)).toList(),
        gridDelegate:const  SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
        ));
  }
}
