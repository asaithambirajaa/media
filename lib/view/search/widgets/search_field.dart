import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/coordinator/app_coordinator.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/res/utils.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';
import 'package:media_app/view_model/cubit/search_state.dart';
import 'package:media_app/view_model/query_view_model.dart';

class SearchField extends StatefulWidget {
  final Function(String)? onChanged;
  const SearchField({super.key, this.onChanged});

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
    final coordi = AppCoordinator(context);
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is NoConnectivity) {
          AppUtils.showError(context, 'No internet connection.');
        }
        if (state is SearchErrorState) {
          AppUtils.showError(context, state.msg);
        } else if (state is SearchLoadedState) {
          coordi.navigateTo(state.searchResult);
        }
      },
      child: Form(
        key: _formKey,
        child: QueryInheritedWidget(
          query: typingTxt,
          child: TextFormField(
            controller: _controller,
            onChanged: widget.onChanged,
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
                context.read<SearchCubit>().fetchData(query);
              }
            },
          ),
        ),
      ),
    );
  }
}
