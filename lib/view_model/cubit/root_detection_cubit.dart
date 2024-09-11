import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/view_model/cubit/root_detection_state.dart';

import '../../model/service/detection_service.dart';

class DetectionCubit extends Cubit<DetectionState> {
  final DetectionService _service;

  DetectionCubit(this._service) : super(DetectionInitialState());

  Future<void> checkRootStatus() async {
    emit(DetectionLoadingState());
    final status = await _service.checkRootStatus();
    status.fold((l) {
      return emit(RDErrorState(msg: "Error"));
    }, (r) {
      emit(DetectionLoadedState(
        rootedCheck: r['rootedCheck']!,
        devMode: r['devMode']!,
        jailbreak: r['jailbreak']!,
      ));
    });
  }
}
