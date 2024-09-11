import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/view_model/cubit/search_state.dart';

import '../../model/repository/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMediaRepository searchMediaRepository;
  final Connectivity connectivity;
  SearchCubit(this.searchMediaRepository, this.connectivity)
      : super(SearchInitialState());

  fetchData(String typingTxt) async {
    emit(SearchLoadingState());
    ConnectivityResult connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
    } catch (e) {
      connectivityResult = ConnectivityResult.none;
    }
    if (connectivityResult == ConnectivityResult.none) {
      emit(NoConnectivity());
    } else {
      final res = await searchMediaRepository.fetchMediaList(typingTxt);
      res.fold(
        (l) => emit(
          SearchErrorState(msg: l),
        ),
        (r) => emit(SearchLoadedState(searchResult: r)),
      );
    }
  }
}
