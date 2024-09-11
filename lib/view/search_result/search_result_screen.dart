import 'package:flutter/material.dart';
import 'package:media_app/model/data_model/media_model/media_model.dart';
import 'package:media_app/res/AppContextExtension.dart';
import 'package:media_app/view/shared/text_view.dart';
import 'widget/grid_view_result.dart';
import 'widget/list_view_result.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchResultScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resources = context.resources;
    final searchResultModel =
        ModalRoute.of(context)?.settings.arguments as SearchResultModel;
    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
        backgroundColor: resources.color.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.resources.color.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const MyTextView(label: 'iTunes'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? context.resources.color.tabBarColor
                      : context.resources.color.transparentColor,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.center,
                child: MyTextView(
                  label: "Grid Layout",
                  fontSize: context.resources.dimension.smallText,
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? context.resources.color.tabBarColor
                      : context.resources.color.transparentColor,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.center,
                child: MyTextView(
                  label: "List Layout",
                  fontSize: context.resources.dimension.smallText,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GridViewResultWidget(
                        mediaList: searchResultModel.results ?? [],
                        mediaType: "Movies",
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListViewResultWidget(
                        mediaList: searchResultModel.results ?? [],
                        mediaType: "Movies",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
