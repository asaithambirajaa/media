// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_app/view/media_selection/media_selection_screen.dart';
import 'package:media_app/view_model/media_selection_cubit.dart';

void main() async {
  testWidgets('Media Selection smoke test', (WidgetTester tester) async {
    // Arrange: Create a CounterCubit instance
    final mediaSelectionCubit = MediaSelectionCubit();

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MediaSelectionCubit>(
          create: (_) => mediaSelectionCubit,
          child: const MediaSelectionScreen(),
        ),
      ),
    );

    // Verify initial state
    // expect(find.text('Counter: 0'), findsOneWidget);
    // expect(find.text('Counter: 1'), findsNothing);

    // Act: Tap the '+' icon and trigger a frame
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Assert: Verify the counter has incremented
    // expect(find.byIcon(Icons.check), findsNothing);
    // expect(find.text('Counter: 1'), findsOneWidget);
  });
}
