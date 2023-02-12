import 'package:flutter/material.dart';

import '../models/models.dart';

class ChipDropdown extends StatelessWidget {
  final StoryCharacter storyCharacter;

  const ChipDropdown({super.key, required this.storyCharacter});

  List<Widget> createChips(context) {
    final chips = <Widget>[];
    this.storyCharacter.Items.forEach((element) {
      final chip = ChoiceChip(
          labelPadding: EdgeInsets.all(0),
          avatar: element.contains("c")
              ? Icon(color: Colors.white, Icons.check)
              : null,
          label: Text(element),
          // labelStyle: Theme.of(context).textTheme.bodyText1,
          onSelected: (bool value) {
            // setState(() {
            //   _isFavorited = !_isFavorited;
            // });
          },
          selected: element.contains("c") ? true : false);
      chips.add(chip);
    });
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 155, 155, 155)),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.storyCharacter.Category,
                  style: Theme.of(context).textTheme.headline2,
                ),
                // IconButton(
                //   icon: Icon(Icons.keyboard_arrow_down_rounded),
                //   iconSize: 30,
                //   //color: Colors.red[400],
                //   onPressed: () {
                //     // setState(() {
                //     //   _isFavorited = !_isFavorited;
                //     // });
                //   },
                // ),
              ],
            ),
          ),
          Center(
            child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
                runSpacing: 0,
                children: createChips(context)),
          ),
        ],
      ),
    );
  }
}
