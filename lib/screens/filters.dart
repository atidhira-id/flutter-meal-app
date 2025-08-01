import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal_filter_provider.dart';
import 'package:meal_app/widgets/filter_switch_list_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<Filter, bool> filterState = ref.watch(mealFilterProvider);
    final filterNotifier = ref.read(mealFilterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          FilterSwitchListTile(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals.',
            value: filterState[Filter.glutenFree]!,
            changeValue: (newValue) =>
                filterNotifier.setFilter(Filter.glutenFree, newValue),
          ),
          FilterSwitchListTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
            value: filterState[Filter.lactoseFree]!,
            changeValue: (newValue) =>
                filterNotifier.setFilter(Filter.lactoseFree, newValue),
          ),
          FilterSwitchListTile(
            title: 'Vegetarian Meals',
            subtitle: 'Only include vegetariant meals.',
            value: filterState[Filter.vegetarian]!,
            changeValue: (newValue) =>
                filterNotifier.setFilter(Filter.vegetarian, newValue),
          ),
          FilterSwitchListTile(
            title: 'Vegan Meals',
            subtitle: 'Only include vegan meals.',
            value: filterState[Filter.vegan]!,
            changeValue: (newValue) =>
                filterNotifier.setFilter(Filter.vegan, newValue),
          ),
        ],
      ),
    );
  }
}
