import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/model/data_model/media_selection_model/media_selection_model.dart';
import 'package:media_app/view_model/cubit/media_selection_state.dart';

class MediaSelectionCubit extends Cubit<MediaSelectionState> {
  MediaSelectionCubit() : super(MediaSelectionInitialState());

  List<MediaSelectionModel> mediaTypes = [
    MediaSelectionModel(mediaType: 'movie', isSelected: true),
    MediaSelectionModel(mediaType: 'podcast', isSelected: true),
    MediaSelectionModel(mediaType: 'music', isSelected: true),
    MediaSelectionModel(mediaType: 'musicVideo', isSelected: true),
    MediaSelectionModel(mediaType: 'audiobook', isSelected: true),
    MediaSelectionModel(mediaType: 'shortFilm', isSelected: true),
    MediaSelectionModel(mediaType: 'tvShow', isSelected: true),
    MediaSelectionModel(mediaType: 'software', isSelected: true),
    MediaSelectionModel(mediaType: 'ebook', isSelected: true),
  ];

  fetchData() {
    emit(MediaSelectionInitialState());
    emit(MediaSelectionLoadedState(mediaTypes: mediaTypes));
  }

  /* Map<String, List<String>> mediaKindMap = {
    'movie': ['movieArtist', 'movie'],
    'podcast': ['podcastAuthor', 'podcast'],
    'music': [
      'musicArtist',
      'musicTrack',
      'album',
      'musicVideo',
      'mix',
      'song'
    ],
    'musicVideo': ['musicArtist', 'musicVideo'],
    'audiobook': ['audiobookAuthor', 'audiobook'],
    'shortFilm': ['shortFilmArtist', 'shortFilm'],
    'tvShow': ['tvEpisode', 'tvSeason'],
    'software': ['software', 'iPadSoftware', 'macSoftware'],
    'ebook': ['ebook'],
  }; */

  void toggleSelection(List<MediaSelectionModel> mediaType) {
    emit(MediaSelectionInitialState());
    emit(MediaSelectionLoadedState(mediaTypes: mediaType));
  }
}
