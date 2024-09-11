import 'package:flutter/material.dart';
import 'package:media_app/model/data_model/media_model/media_model.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/view/detailed_view/detailed_view_screen.dart';
import '../../shared/text_view.dart';

class GridViewResultWidget extends StatelessWidget {
  final List<Results> mediaList;
  final String mediaType;

  const GridViewResultWidget(
      {super.key, required this.mediaList, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.maxFinite,
            color: context.resources.color.backgroundColor,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${mediaType[0].toUpperCase()}${mediaType.substring(1)}s',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: mediaList
              .map((media) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: buildGridItem(media, context),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget buildGridItem(Results media, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedViewScreen(media: media),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                media.artworkUrl100 ?? 'https://via.placeholder.com/100',
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://via.placeholder.com/100',
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextView(
                label: media.trackName ?? "",
                fontSize: context.resources.dimension.smallText,
                color: context.resources.color.primaryColor,
              ),
            ),
            // MyTextView(label: media.artistName ?? "", fontSize: context.resources.dimension.smallText,),
          ],
        ),
      ),
    );
  }
}
