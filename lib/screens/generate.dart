import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../services/service.dart';
import '../state_managers/shared_prefs.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    List<ChipDropdown> widget = [];
    var categories = Provider.of<SharedPrefs>(context).getCategories();
    categories.forEach(
        (element) => widget.add(ChipDropdown(storyCharacter: element)));

    return Center(
      child: ListView(
        children: <Widget>[
          ...widget,
          ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('Generate \u{1FAB6}'),
              onPressed: () {}),
        ],
      ),
    );
  }
}
