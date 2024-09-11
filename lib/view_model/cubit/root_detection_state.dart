import 'package:equatable/equatable.dart';

abstract class DetectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetectionInitialState extends DetectionState {}

class DetectionLoadingState extends DetectionState {}

class DetectionLoadedState extends DetectionState {
  final bool rootedCheck;
  final bool devMode;
  final bool jailbreak;

  DetectionLoadedState({
    required this.rootedCheck,
    required this.devMode,
    required this.jailbreak,
  });
}

class RDErrorState extends DetectionState {
  final String msg;

  RDErrorState({required this.msg});
}
