import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/model/data_model/media_selection_model/media_selection_model.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/res/utils.dart';
import 'package:media_app/view/shared/text_view.dart';
import 'package:media_app/view_model/cubit/media_selection_state.dart';
import 'package:media_app/view_model/media_selection_cubit.dart';

class MediaSelectionScreen extends StatefulWidget {
  const MediaSelectionScreen({super.key});

  @override
  State<MediaSelectionScreen> createState() => _MediaSelectionScreenState();
}

class _MediaSelectionScreenState extends State<MediaSelectionScreen> {
  @override
  void initState() {
    context.read<MediaSelectionCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resources = context.resources;
    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: resources.color.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: resources.color.primaryColor,
        title: const MyTextView(label: 'Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<MediaSelectionCubit, MediaSelectionState>(
            builder: (context, state) {
          if (state is MediaSelectionLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: resources.color.chipsColor,
                thickness: 0.7,
                height: 10,
              ),
              itemCount: state.mediaTypes.length,
              itemBuilder: (context, index) {
                MediaSelectionModel mediaType = state.mediaTypes[index];
                return ListTile(
                  title: Text(
                    AppUtils.capitalizeFirstLetter(mediaType.mediaType),
                    style: TextStyle(color: resources.color.secondaryColor),
                  ),
                  trailing: mediaType.isSelected
                      ? Icon(
                          Icons.check,
                          color: resources.color.secondaryColor,
                        )
                      : null,
                  onTap: () {
                    if (mediaType.isSelected) {
                      mediaType.isSelected = false;
                    } else {
                      mediaType.isSelected = true;
                    }
                    context
                        .read<MediaSelectionCubit>()
                        .toggleSelection(state.mediaTypes);
                  },
                );
              },
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
