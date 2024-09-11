// import 'package:flutter/material.dart';
// import 'package:media_app/res/AppContextExtension.dart';
// import 'package:media_app/res/utils.dart';
// import 'package:media_app/view/shared/text_view.dart';

// class MediaSelectionScreen extends StatelessWidget {
//   static const String id = "media_selection_screen";
//   const MediaSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final resources = context.resources;

//     return Scaffold(
//       backgroundColor: resources.color.primaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon:
//               Icon(Icons.arrow_back_ios, color: resources.color.secondaryColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         centerTitle: true,
//         backgroundColor: resources.color.primaryColor,
//         title: const MyTextView(label: 'Media'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView.separated(
//           separatorBuilder: (context, index) => Divider(
//             color: resources.color.chipsColor,
//             thickness: 0.7,
//             height: 10,
//           ),
//           itemCount: mediaViewModelNotifier.mediaTypes.length,
//           itemBuilder: (context, index) {
//             String mediaType = mediaViewModelNotifier.mediaTypes[index];
//             bool isSelected = mediaViewModel.contains(mediaType);
//             return ListTile(
//               title: Text(AppUtils.capitalizeFirstLetter(mediaType)),
//               trailing: isSelected ? const Icon(Icons.check) : null,
//               onTap: () {
//                 mediaViewModelNotifier.toggleSelection(mediaType);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
