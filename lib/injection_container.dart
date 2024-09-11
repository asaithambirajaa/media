import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:media_app/model/repository/search_repository.dart';
import 'package:media_app/model/service/detection_service.dart';
import 'package:media_app/view_model/cubit/root_detection_cubit.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Shop Location

  // Cubit
  sl.registerFactory<DetectionCubit>(() => DetectionCubit(sl()));
  sl.registerLazySingleton<DetectionService>(() => DetectionService());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<SearchMediaRepository>(
      () => SearchMediaRepository());
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl(), sl()));
}
