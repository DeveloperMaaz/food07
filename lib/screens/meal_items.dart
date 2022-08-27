import 'package:flutter/material.dart';
import 'package:food07/models/meal_varlist.dart';

class MealItems extends StatelessWidget{

  late final String id;
  late final String title;
  late final String imageUrl;
  late final int  duration;
  late final Complexity complexity;
  late final Affordability affordability;
  late var removeItem;

  MealItems({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  });

     String ? get complexityText {
       switch (complexity){
      case Complexity.Simple:
      return 'simple';
      break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
         default:
           return 'nothing';
     }
  }

  String ? get AffordabilityText {
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
       return 'Luxurious';
        break;
      default:
        return 'nothing';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/MealDetails',
            arguments: id).then((result) {
           print(result);
           if(result!=null){
             removeItem(result);
           }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [

                ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),),
                  child: Image.network(imageUrl,
                      height: 250,
                      width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0,
                    ),
                    color: Colors.black54,
                    width: 300,
                    child: Text(title,style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                    overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(

                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5.0,),
                      Text('$duration'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5.0,),
                      Text(complexityText!),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5.0,),
                      Text(AffordabilityText!),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
