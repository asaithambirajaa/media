import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/view_model/cubit/root_detection_cubit.dart';
import 'package:media_app/view_model/cubit/root_detection_state.dart';

import '../shared/text_view.dart';
import 'package:media_app/res/constant.dart' as route;

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  @override
  void initState() {
    context.read<DetectionCubit>().checkRootStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resources = context.resources;

    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
          backgroundColor: resources.color.primaryColor,
          title: const MyTextView(label: 'Detection')),
      body: BlocConsumer<DetectionCubit, DetectionState>(
        buildWhen: (previous, current) {
          if (current is DetectionLoadedState) {
            if (current.rootedCheck || current.devMode || current.jailbreak) {
              return true;
            }
            return false;
          } else {
            return true;
          }
        },
        listenWhen: (previous, current) {
          if (current is DetectionLoadedState) {
            if (!current.rootedCheck ||
                !current.devMode ||
                !current.jailbreak) {
              return true;
            }
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          if (state is DetectionLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetectionLoadedState) {
            return Center(
              child: state.rootedCheck || state.devMode || state.jailbreak
                  ? _buildRootedContent(
                      context, state.rootedCheck, state.jailbreak)
                  : _buildNotRootedContent(context),
            );
          }
          return const SizedBox();
        },
        listener: (context, state) {
          if (state is DetectionLoadedState) {
            if (!state.rootedCheck) {
              Navigator.of(context)
                  .pushReplacementNamed(route.Route.kSEARCH_PAGE);
            }
          }
        },
      ),
    );
  }

  Widget _buildRootedContent(
      BuildContext context, bool isRootDevice, bool isJailbreak) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.warning, size: 80, color: Colors.red),
        const SizedBox(height: 20),
        const MyTextView(
          label: 'Access Denied',
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        const SizedBox(height: 10),
        MyTextView(
          label: isRootDevice || isJailbreak
              ? 'This app cannot be used on rooted devices.'
              : "Can you please disable developer mode",
          fontWeight: FontWeight.bold,
          fontSize: context.resources.dimension.smallText,
        ),
      ],
    );
  }

  Widget _buildNotRootedContent(BuildContext context) {
    return Container();
  }
}

/*class RootDetectionApp extends StatefulWidget {
  const RootDetectionApp({super.key});

  @override
  _RootDetectionAppState createState() => _RootDetectionAppState();
}

 class _RootDetectionAppState extends State<RootDetectionApp> {
  @override
  void initState() {
    super.initState();
    // Perform root check on app start
    /*  ref.read(rootDetectionProvider.notifier).checkRootStatus().then((_) {
      final rootState = ref.read(rootDetectionProvider);
      if (!rootState.rootedCheck) {
        Navigator.of(context).pushReplacementNamed(SearchScreen.id);
      }
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RootDetectionScreen(),
    );
  }
} */
