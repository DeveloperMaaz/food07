import 'package:flutter/material.dart';
import 'package:food07/screens/filters.dart';
import 'package:food07/screens/tab_screen.dart';

import 'catory.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              height: 100.0,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              alignment: Alignment.centerLeft,
              child: Text('Cooking Up',
              style: TextStyle(
                fontSize: 20.0,
              ),),
            ),
            BuildTiles('Meals',
                Icons.restaurant,
                () {

              Navigator.of(context).pushReplacementNamed('/');
                }

            ),
            BuildTiles('Filters',
              Icons.settings,
                (){
                  Navigator.pushReplacementNamed(context, '/filters');

                }
            ),
          ],
        ),
      ),
    );
  }
}





Widget BuildTiles(String text,IconData icon, VoidCallback tabHandler){
  return ListTile(
    leading: Icon(icon,size: 26.0,),
    title: Text(text,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0),
    ),
    onTap: tabHandler,
  );
}
