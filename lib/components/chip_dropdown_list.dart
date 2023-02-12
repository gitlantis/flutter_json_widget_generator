// import 'package:flutter/material.dart';

// class ChipDropdownList extends StatelessWidget{
// final items
// }

import 'package:flutter/cupertino.dart';
import 'package:story_teller/models/models.dart';

import 'components.dart';

class ChipDropdownList extends StatelessWidget {
  final List<StoryCharacter> characters;

  const ChipDropdownList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    var itemCharacters = <Widget>[];
    return Column(children: itemCharacters);
  }
}
