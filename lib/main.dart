import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/injection_container.dart';
import 'package:media_app/res/constant.dart' as route;
import 'package:media_app/view/media_selection/media_selection_screen.dart';
import 'package:media_app/view/search/search_screen.dart';
import 'package:media_app/view/search_result/search_result_screen.dart';
import 'package:media_app/view_model/cubit/root_detection_cubit.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';
import 'package:media_app/view_model/media_selection_cubit.dart';

import 'view/detection/detection_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetectionCubit>(create: (context) => DetectionCubit(sl())),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit(sl(), sl())),
        BlocProvider<MediaSelectionCubit>(create: (context) => MediaSelectionCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          route.Route.kSEARCH_PAGE: (context) => const SearchScreen(),
          route.Route.kMEDIA_PAGE: (context) => const MediaSelectionScreen(),
          route.Route.kSEARCH_RESULT_PAGE: (context) =>
              const SearchResultScreen(),
        },
        home: const DetectionPage(),
      ),
    );
  }
}
