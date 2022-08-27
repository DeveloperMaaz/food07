import 'package:flutter/material.dart';
import 'package:food07/dumy_lists/dummy_list.dart';

class MealDetails extends StatelessWidget {

  var togleFavoratie;
  var isfavorite;
  MealDetails(this.togleFavoratie,this.isfavorite);

  @override
  Widget build(BuildContext context){

    final MealID =ModalRoute.of(context)!.settings.arguments as String;
    final selectModel=DUMMY_MEAL.firstWhere((meal) =>meal.id==MealID);

    return Scaffold(
      appBar: AppBar(title: Text('${selectModel.title}'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(selectModel.imageUrl),
            ),

           _buildSectionTitle(context, 'Ingredients'),

            _buildContainerList(
              context,
              ListView.builder(itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                color: Colors.yellow,
                child: Text(selectModel.ingredients[index]),
              ),
                itemCount: selectModel.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),

            _buildContainerList( context,
              ListView.builder(itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(child: Text('#${index+1}'),),
                title: Text(selectModel.steps[index]),
              ),
                itemCount: selectModel.steps.length,
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>togleFavoratie(MealID),
        child: Icon(
            isfavorite(MealID)?Icons.star:Icons.star_border,
        ),
      ),
    );
  }
}


Widget _buildSectionTitle(BuildContext context,String text){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: Text(text,
        style: const TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    )),
  );
}



  Widget _buildContainerList(BuildContext context ,Widget child){
  return  Container(

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.grey),
    ),
    height: 150.0,
    width: 300,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),

   child: child,
  );
}