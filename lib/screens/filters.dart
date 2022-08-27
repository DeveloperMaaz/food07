import 'package:flutter/material.dart';
import 'package:food07/models/meal_varlist.dart';
import 'package:food07/screens/drawer.dart';

class Filters extends StatefulWidget {

  var saveFilters;

 final  Map<String,bool> _curentFilters;

  Filters(this._curentFilters, this.saveFilters);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  bool  _gluenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactos=false;

  
  Widget _Switches(String title,String subT,bool value, var function){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subT),
      value: value,
      onChanged: function,
    );
  }


  @override
  void initState() {

      _gluenFree=widget._curentFilters['gluent']!;
      _vegetarian=widget._curentFilters['vegetarian']!;
      _lactos=widget._curentFilters['lactos']!;
      _vegan==widget._curentFilters['vegan']!;
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(title: const Text('Filters'),
   actions: [
    IconButton(onPressed: (){
      final selectedFilters={
        'gluent':_gluenFree,
        'lactos':_lactos,
        'vegan':_vegan,
        'vegetarian':_vegetarian,
      };
      widget.saveFilters(selectedFilters);
      },
      icon: const Icon(Icons.save),),
   ],
   ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text('Adjust your meal selection',
              style: TextStyle(fontSize: 20.0,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: ListView(
            children: [
              
              _Switches('Gluent-Free', 'Only include gluent free',
                  _gluenFree,
                      (newGF) {
                setState(() {
                  _gluenFree=newGF;
                });
                  }),

              _Switches('Lactos-Free', 'Only include Lactos free',
                  _lactos,
                      (newLF) {
                    setState(() {
                      _lactos=newLF;
                    });
                  }),

              _Switches('Vegetarian-Free', 'Only include vegetarian free',
                  _vegetarian,
                      (newVG) {
                    setState(() {
                      _vegetarian=newVG;
                    });
                  }),

              _Switches('Vegan-Free', 'Only include Vegan free',
                  _vegan,
                      (newVGN) {
                    setState(() {
                      _vegan=newVGN;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
