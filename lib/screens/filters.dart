import 'package:flutter/material.dart';
import 'package:meal_app/widgets/filter_switch_list_tile.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filterState});

  final Map<Filter, bool> filterState;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.filterState[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.filterState[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.filterState[Filter.vegetarian]!;
    _veganFilterSet = widget.filterState[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterSwitchListTile(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals.',
              value: _glutenFreeFilterSet,
              changeValue: (newValue) => setState(() {
                _glutenFreeFilterSet = newValue;
              }),
            ),
            FilterSwitchListTile(
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals.',
              value: _lactoseFreeFilterSet,
              changeValue: (newValue) => setState(() {
                _lactoseFreeFilterSet = newValue;
              }),
            ),
            FilterSwitchListTile(
              title: 'Vegetarian Meals',
              subtitle: 'Only include vegetariant meals.',
              value: _vegetarianFilterSet,
              changeValue: (newValue) => setState(() {
                _vegetarianFilterSet = newValue;
              }),
            ),
            FilterSwitchListTile(
              title: 'Vegan Meals',
              subtitle: 'Only include vegan meals.',
              value: _veganFilterSet,
              changeValue: (newValue) => setState(() {
                _veganFilterSet = newValue;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
