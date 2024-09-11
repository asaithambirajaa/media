import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/coordinator/app_coordinator.dart';
import 'package:media_app/res/Resources.dart';
import 'package:media_app/res/utils.dart';
import 'package:media_app/view/shared/text_view.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';
import 'package:media_app/view_model/cubit/search_state.dart';

class SubmitButton extends StatelessWidget {
  final Resources resources;
  final String typingTxt;

  const SubmitButton(
      {super.key, required this.resources, required this.typingTxt});

  @override
  Widget build(BuildContext context) {
    final coordi = AppCoordinator(context);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // if (state is NoConnectivity) {
        //   AppUtils.showError(context, 'No internet connection.');
        // }
        // if (state is SearchErrorState) {
        //   AppUtils.showError(context, state.msg);
        // } else if (state is SearchLoadedState) {
        //   coordi.navigateTo(state.searchResult);
        // }
      },
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return _buildLoadingIndicator();
        }
        return SizedBox(
          width: double.maxFinite,
          height: resources.dimension.buttonHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: resources.color.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () => _handleSubmit(typingTxt, context),
            child: const MyTextView(
              label: "Submit",
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  void _handleSubmit(String query, BuildContext context) {
    if (query.trim().isNotEmpty) {
      context.read<SearchCubit>().fetchData(query);
    } else {
      AppUtils.showError(context, 'Please enter a search query');
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
