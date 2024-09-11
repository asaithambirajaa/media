import 'package:equatable/equatable.dart';

import '../../model/data_model/media_model/media_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final SearchResultModel searchResult;

  SearchLoadedState({required this.searchResult});
}

class SearchErrorState extends SearchState {
  final String msg;

  SearchErrorState({required this.msg});
}

class NoConnectivity extends SearchState {
  
}