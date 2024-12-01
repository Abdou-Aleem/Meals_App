import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/filters_provider.dart';





class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            activeFilters[Filter.glutenFree]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, value),
          ),
          customSwitch(
            context,
            'Lactose-free',
            'Only include lactose-free meals.',
            activeFilters[Filter.lactoseFree]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, value),
          ),
          customSwitch(
            context,
            'Vegan',
            'Only include vegan meals.',
            activeFilters[Filter.vegan]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, value),
          ),
          customSwitch(
            context,
            'Vegetarian',
            'Only include vegetarian meals.',
            activeFilters[Filter.vegeterian]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegeterian, value),
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}



// class FiltersScreen extends ConsumerStatefulWidget {
//   const FiltersScreen({super.key});

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// // enum Filter {
// //   glutenFree,
// //   lactoseFree,
// //   vegan,
// //   vegeterian,
// // }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   bool _glutenFreeFilter = false;
//   bool _lactoseFreeFilter = false;
//   bool _veganFilter = false;
//   bool _vegetarianFilter = false;

//   @override
//   void initState() {
//     super.initState();

//     final Map<Filter, bool> activeFilters =  ref.read(filtersProvider);

//     _glutenFreeFilter = activeFilters[Filter.glutenFree]!;
//     _lactoseFreeFilter = activeFilters[Filter.lactoseFree]!;
//     _veganFilter = activeFilters[Filter.vegan]!;
//     _veganFilter = activeFilters[Filter.vegeterian]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Filters'),
//       ),
//       // drawer: MainDrawer(onSelectScreen: (identifier) {
//       //   Navigator.of(context).pop();
//       //   if (identifier == 'meals') {
//       //     Navigator.pushReplacement(
//       //       context,
//       //       MaterialPageRoute(
//       //         builder: (ctx) => TabsScreen(),
//       //       ),
//       //     );
//       //   }
//       // }),

//       body: Column(
//         children: [
//           customSwitch(
//             context,
//             'Gluten-free',
//             'Only include gluten-free meals.',
//             activeFilters[Filter.glutenFree]!,
//             (bool value) => ref
//                 .read(filtersProvider.notifier)
//                 .setFilter(Filter.glutenFree, value),
//           ),
//           customSwitch(
//             context,
//             'Lactose-free',
//             'Only include lactose-free meals.',
//             activeFilters[Filter.lactoseFree]!,
//             (bool value) => ref
//                 .read(filtersProvider.notifier)
//                 .setFilter(Filter.lactoseFree, value),
//           ),
//           customSwitch(
//             context,
//             'Vegan',
//             'Only include vegan meals.',
//             activeFilters[Filter.vegan]!,
//             (bool value) => ref
//                 .read(filtersProvider.notifier)
//                 .setFilter(Filter.vegan, value),
//           ),
//           customSwitch(
//             context,
//             'Vegetarian',
//             'Only include vegetarian meals.',
//             activeFilters[Filter.vegeterian]!,
//             (bool value) => ref
//                 .read(filtersProvider.notifier)
//                 .setFilter(Filter.vegeterian, value),
//           ),
//         ],
//       ),
//       // 
//       // 
//       // 
//       // 
//       // 
//       // 
//       // Column(
//       //   children: [
//       //     customSwitch(
//       //         context,
//       //         'Gluten-free',
//       //         'Only include gluten-free meals.',
//       //         _glutenFreeFilter, (bool value) {
//       //       setState(() {
//       //         _glutenFreeFilter = value;
//       //       });
//       //     }),
//       //     customSwitch(
//       //         context,
//       //         'Lactose-free',
//       //         'Only include lactose-free meals.',
//       //         _lactoseFreeFilter, (bool value) {
//       //       setState(() {
//       //         _lactoseFreeFilter = value;
//       //       });
//       //     }),
//       //     customSwitch(
//       //         context, 'Vegan', 'Only include vegan meals.', _veganFilter,
//       //         (bool value) {
//       //       setState(() {
//       //         _veganFilter = value;
//       //       });
//       //     }),
//       //     customSwitch(context, 'Vegetarian', 'Only include vegetarian meals.',
//       //         _vegetarianFilter, (bool value) {
//       //       setState(() {
//       //         _vegetarianFilter = value;
//       //       });
//       //     }),
//       //   ],
//       // ),
//     );
//   }

//   SwitchListTile customSwitch(
//     BuildContext context,
//     String title,
//     String subtitle,
//     bool filter,
//     Function(bool newValue) onChanged,
//   ) {
//     return SwitchListTile(
//         title: Text(
//           title,
//           style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//         ),
//         activeColor: Theme.of(context).colorScheme.tertiary,
//         contentPadding: EdgeInsets.only(left: 34, right: 22),
//         value: filter,
//         onChanged: onChanged);
//   }
// }
