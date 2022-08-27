import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food07/models/meal_varlist.dart';
import 'package:food07/screens/drawer.dart';
import 'package:food07/screens/favourite.dart';

import 'catory.dart';

class BottomTabBar extends StatefulWidget {

  late final List<Meal> _favMeal;

  BottomTabBar(this._favMeal);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {

    int _selectIndex=0;
   late final List<Map<String,dynamic>> _pages;

  void _selectTap(int index){
    setState(() {
      _selectIndex=index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'Pages': categoryScreen(),
        'title':'Categories'
      },

      {'Pages':Favourite(widget._favMeal),
        'title':'Favorite'
      },

    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: _pages[_selectIndex]['Pages'],

      appBar: AppBar(title: Text(_pages[_selectIndex]['title']),),
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectTap,

        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
          label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: "Favorite",
          ),],
      ),
    );
  }
}
