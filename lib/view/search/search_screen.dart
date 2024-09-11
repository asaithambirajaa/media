import 'package:flutter/material.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/view/search/widgets/paramter_selector.dart';

import '../../res/Resources.dart';
import '../shared/text_view.dart';
import 'widgets/search_field.dart';
import 'widgets/submit_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String typingTxt = "";
  @override
  Widget build(BuildContext context) {
    final resources = context.resources;
    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: resources.screenHeight,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeaderRow(resources),
                const SizedBox(height: 60),
                _buildDescriptionText(resources),
                const SizedBox(height: 40),
                SearchField(
                  onChanged: (val) {
                    setState(() {
                      typingTxt = val;
                    });
                  },
                ),
                const SizedBox(height: 40),
                _buildParameterText(resources),
                const SizedBox(height: 40),
                const ParameterSelector(),
                const SizedBox(height: 40),
                SubmitButton(resources: resources, typingTxt: typingTxt),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(Resources resources) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.apple,
          color: resources.color.secondaryColor,
          size: resources.dimension.iconMediumSize,
        ),
        const MyTextView(
          label: "iTunes",
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget _buildDescriptionText(Resources resources) {
    return MyTextView(
      label:
          "Search for a variety of content from the iTunes store including iBooks, movies, podcasts, music, music videos, and audiobooks.",
      fontSize: resources.dimension.mediumText,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildParameterText(Resources resources) {
    return MyTextView(
      label: "Specify the parameter for the content to be searched",
      fontSize: resources.dimension.smallText,
      fontWeight: FontWeight.bold,
    );
  }
}
