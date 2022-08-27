import 'package:flutter/material.dart';
import 'package:food07/models/meal_varlist.dart';
import 'meal_items.dart';



class Favourite extends StatelessWidget {

  late final List<Meal> _favourites;
  Favourite(this._favourites);


  @override
  Widget build(BuildContext context) {

    if(_favourites.isEmpty){
      return const Center(
        child: Text('There is no items in favorite')
      );
    }
    else{

         return ListView.builder(
          itemCount: _favourites.length,
          itemBuilder: (ctx,index){
            return MealItems(
              id: _favourites[index].id,
              title: _favourites[index].title,
              imageUrl:_favourites[index].imageUrl,
              duration: _favourites[index].duration,
              complexity: _favourites[index].complexity,
              affordability: _favourites[index].affordability, removeItem: null,
            );
          });

    }
  }

}
