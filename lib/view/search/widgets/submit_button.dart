import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/coordinator/app_coordinator.dart';
import 'package:media_app/res/Resources.dart';
import 'package:media_app/view/shared/text_view.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';
import 'package:media_app/view_model/cubit/search_state.dart';
import 'package:media_app/view_model/query_view_model.dart';

class SubmitButton extends StatelessWidget {
  final Resources resources;

  const SubmitButton({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    final query = QueryInheritedWidget.of(context);
    final coordi = AppCoordinator(context);
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is NoConnectivity) {
          _showError(context, 'No internet connection.');
        }
        if (state is SearchErrorState) {
          _showError(context, state.msg);
        } else if (state is SearchLoadedState) {
          coordi.navigateTo(state.searchResult);
        }
      },
      child: SizedBox(
        width: double.maxFinite,
        height: resources.dimension.buttonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: resources.color.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onPressed:
              /* searchState.loading
                ? null
                : */
              () => _handleSubmit(query == null ? "lio" : query.query, context),
          child:
              /* searchState.loading
                ? _buildLoadingIndicator()
                :  */
              const MyTextView(
            label: "Submit",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _showError(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(
          txt,
          style: const TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Colors.redAccent, // Background color
        behavior:
            SnackBarBehavior.floating, // Optional: make the SnackBar float
      ),
    );
  }

  void _handleSubmit(String query, BuildContext context) {
    if (query.trim().isNotEmpty) {
      context.read<SearchCubit>().fetchData("lio");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a search query',
            style: TextStyle(color: Colors.white), // Text color
          ),
          backgroundColor: Colors.redAccent, // Background color
          behavior:
              SnackBarBehavior.floating, // Optional: make the SnackBar float
        ),
      );
    }
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: 24.0,
      height: 24.0,
      child: Stack(
        children: [
          const Positioned.fill(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Center(
            child: SizedBox(
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
