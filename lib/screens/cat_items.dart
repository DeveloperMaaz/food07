import 'package:flutter/material.dart';
import 'package:food07/screens/meal_screen.dart';
import '../dumy_lists/dummy_list.dart';

class Items extends StatelessWidget {
  late final String id;
  late final String tittle;
  late final Color color;
  Items(this.id,this.tittle,this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(tittle),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ]),
          borderRadius: BorderRadius.circular(15.0),

        ),
      ),
      onTap: ()=>Navigator.pushNamed(context, '/MealCategories',arguments: {
        'id':id,
         'title':tittle,
      }),
    );
  }
}
