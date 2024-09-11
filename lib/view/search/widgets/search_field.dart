import 'package:flutter/material.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/res/constant.dart';
import 'package:media_app/res/constant.dart' as route;
import 'package:media_app/view_model/query_view_model.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  String typingTxt = "";
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: QueryInheritedWidget(
        query: typingTxt,
        child: TextFormField(
          controller: _controller,
          onChanged: (value) {
            setState(() {
              typingTxt = value;
            });
          },
          style: TextStyle(color: context.resources.color.secondaryColor),
          decoration: InputDecoration(
            hintText: 'Search...',
            filled: true,
            fillColor: context.resources.color.textFieldColor,
            hintStyle: TextStyle(
              color: context.resources.color.secondaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          textInputAction: TextInputAction.search,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a search query';
            }
            return null;
          },
          onFieldSubmitted: (query) {
            if (_formKey.currentState?.validate() ?? false) {
              // searchViewModel.fetchMedia(query).then(
              //   (value) {
              //     Navigator.of(context)
              //         .pushNamed(route.Route.kSEARCH_RESULT_PAGE);
              //   },
              // );
            }
          },
        ),
      ),
    );
  }
}
