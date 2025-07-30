import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatelessWidget {
  const FilterSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.changeValue,
  });

  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool newValue) changeValue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (isChecked) {
        changeValue(isChecked);
      },
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
      contentPadding: const EdgeInsets.only(left: 30, right: 20),
    );
  }
}
