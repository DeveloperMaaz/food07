import 'package:flutter/material.dart';
import 'package:food07/dumy_lists/dummy_list.dart';
import 'package:food07/models/meal_varlist.dart';
import 'package:food07/screens/filters.dart';
import 'package:food07/screens/meal_details.dart';
import 'package:food07/screens/meal_screen.dart';
import 'package:food07/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _available=DUMMY_MEAL;

  List<Meal>_favourite=[];

  Map<String,bool> _filters={
  'gluent':false,
    'lactos':false,
    'vegan':false,
    'vegetarian':false,
};

  void _setFilters(Map<String,bool> filterdata)
  {
    setState(() {
      _filters=filterdata;

      _available=DUMMY_MEAL.where((meal){

        if (_filters['gluent']==true && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactos']==true &&!meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']==true&&!meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']==true&&meal.isVegetarian){
          return false;
        }
        return true;

      } ).toList();

    });
  }


  bool _isFavorite(String id){
    return _favourite.any((meal) => meal.id==id);
  }

  void _toogleFavorite(String mealId){
    final existingIndex=_favourite.indexWhere((element) => element.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favourite.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favourite.add(DUMMY_MEAL.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 225, 1),
       // fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(),
          bodyText2: const TextStyle(),

        ),
      ),
      initialRoute: '/',
      routes:{
        '/':(ctx)=> BottomTabBar(_favourite),
        '/MealCategories':(ctx)=>MealScreen(_available),
        '/MealDetails':(ctx)=>MealDetails(_toogleFavorite,_isFavorite),
        '/filters':(ctx)=>Filters(_filters,_setFilters),
      },
    );
  }
}