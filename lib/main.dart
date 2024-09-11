import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/injection_container.dart';
import 'package:media_app/res/constant.dart' as route;
import 'package:media_app/view/search/search_screen.dart';
import 'package:media_app/view/search_result/search_result_screen.dart';
import 'package:media_app/view_model/cubit/root_detection_cubit.dart';
import 'package:media_app/view_model/cubit/search_cubit.dart';

import 'view/root_detection/root_detection_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // objectBox = await ObjectBox.init();
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          route.Route.kSEARCH_PAGE: (context) => const SearchScreen(),
          //route.Route.kMEDIA_PAGE: (context) => const MediaSelectionScreen(),
          route.Route.kSEARCH_RESULT_PAGE: (context) => const SearchResultScreen(),
        },
        home: const DetectionPage(),
      ),
    );
  }
}

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: checkRootStatus,
              child: const Text("RootStatus"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: checkDeveloperModeStatus,
              child: const Text("Developer Mode"),
            ),
          ],
        ),
      ),
    );
  }
} */
