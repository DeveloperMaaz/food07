import 'package:flutter/material.dart';
import 'package:food07/models/meal_varlist.dart';
import 'package:food07/screens/meal_items.dart';

class MealScreen extends StatefulWidget {

  late final List<Meal> _availableMeals;
  MealScreen(this._availableMeals);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {

   String? categoryTitle;
  late List<Meal> displayMeal;
   var _loadedData=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedData){

      final routeArgm=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      final mId=routeArgm['id'];
      categoryTitle=routeArgm['title'];
      displayMeal=widget._availableMeals.where((meal) {
        return meal.categories.contains(mId);
        _loadedData=true;
      }).toList();

    }
    super.didChangeDependencies();
  }
  void _removeItem(String MealId){
    setState(() {
      displayMeal.removeWhere((element) => element.id==MealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!),),
      body: ListView.builder(
        itemCount: displayMeal.length,
          itemBuilder: (ctx,index){
        return MealItems(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imageUrl:displayMeal[index].imageUrl,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,
            removeItem: _removeItem,
        );
      }),
    );
  }
}
