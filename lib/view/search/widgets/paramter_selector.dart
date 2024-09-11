import 'package:flutter/material.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/res/constant.dart' as route;

class ParameterSelector extends StatelessWidget {
  const ParameterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mediaTypes = [
      'movie',
      'podcast',
      'music',
      'musicVideo',
      'audiobook',
      'shortFilm',
      'tvShow',
      'software',
      'ebook',
    ];
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route.Route.kMEDIA_PAGE);
      },
      child: Container(
        width: double.maxFinite,
        height: context.resources.screenHeight * 0.15,
        color: context.resources.color.backgroundColor,
        child: Wrap(
          spacing: 8.0,
          children: mediaTypes.map((parameter) {
            return ChoiceChip(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      context.resources.dimension.chipsBorderRadius))),
              selected: false,
              color: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return context.resources.color.chipsColor; // Default color
                },
              ),
              label: Text(
                parameter,
                style: TextStyle(color: context.resources.color.secondaryColor),
              ),
              onSelected: (selected) {},
            );
          }).toList(),
        ),
      ),
    );
  }
}
