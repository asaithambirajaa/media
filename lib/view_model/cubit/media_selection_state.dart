import 'package:equatable/equatable.dart';
import 'package:media_app/model/data_model/media_selection_model/media_selection_model.dart';

abstract class MediaSelectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MediaSelectionInitialState extends MediaSelectionState {}

class MediaSelectionLoadedState extends MediaSelectionState {
  final List<MediaSelectionModel> mediaTypes;

  MediaSelectionLoadedState({required this.mediaTypes});
}
