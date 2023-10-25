import 'package:meals_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';



class MealsNotifier extends StateNotifier<List<Meal>>{
  MealsNotifier():super(dummyMeals);
  void renameMeal(String mealId, String newTitle){
    final meals = [...state];
    meals.firstWhere((Meal meal) => meal.id == mealId).title = newTitle;
    state = meals;
  }
  Meal getMeal(String id){
    return state.firstWhere((meal) => meal.id == id);
  }
}

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref){
  return MealsNotifier();
});