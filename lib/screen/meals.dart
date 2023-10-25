import 'package:flutter/material.dart';
import 'package:meals_app/screen/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(meal, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if (meals.isEmpty) {
      bodyWidget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    } else {
      bodyWidget = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (listContext, index) => MealItem(meal: meals[index], onSelect: (Meal meal){
          _selectMeal(meal, context);
        },),
      );
    }

    if(title == null) return bodyWidget;

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: bodyWidget,
    );
  }
}
