import 'package:flutter/material.dart';

class QueryInheritedWidget extends InheritedWidget {
  final String query;

  const QueryInheritedWidget(
      {super.key, required Widget child, required this.query})
      : super(child: child);

  // This method is used to determine whether the child widgets should rebuild
  @override
  bool updateShouldNotify(QueryInheritedWidget oldWidget) {
    // If the counter has changed, rebuild the dependent widgets
    return oldWidget.query != query;
  }

  // Static method to help child widgets access the InheritedWidget
  static QueryInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<QueryInheritedWidget>();
  }
}
