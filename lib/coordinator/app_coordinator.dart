import 'package:flutter/material.dart';
import 'package:media_app/model/data_model/media_model/media_model.dart';
import 'package:media_app/res/constant.dart' as route;

class AppCoordinator {
  final BuildContext context;

  AppCoordinator(this.context);

  void navigateTo(SearchResultModel? viewModel) {
    Navigator.pushNamed(
      context,
      route.Route.kSEARCH_RESULT_PAGE,
      arguments: viewModel
    );
  }
}
