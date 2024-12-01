import 'package:flutter/material.dart';
import 'package:mealapp/providers/favorites_provider.dart';
import 'package:mealapp/providers/filters_provider.dart';
import '../providers/nav_bar_provider.dart';
import 'filters_screen.dart';
import '../screens/categories_screeen.dart';
import 'meals_screen.dart';
import '../models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// const Map<dynamic, bool> kInitialFilter = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegan: false,
//   Filter.vegeterian: false,
// };

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});


  // int _selectedPageIndex = 0;
  // final List<Meal> _favoriteMeal = [];
  // Map<Filter, bool> _selectedFilters = kInitialFilter;
  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // void _setScreen(String identifier) {

  // }

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    // final meals = ref.watch(mealsProvider);
    // final  Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
final int selectedPageIndex = ref.watch(navBarProvider);
    // final List<Meal> availableMeals = meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activePage = CategoriesScreeen(
      availableMeals: availableMeals,
    );

    var activePageTile = 'Pick Your Category';

    if (selectedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
        // onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTile = 'Favorits';
    }



    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTile),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: (String  identifier){
              if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Cateories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
