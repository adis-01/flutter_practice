import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:test_desktop/providers/story_provider.dart';
import 'package:test_desktop/screens/user_profile_screen.dart';
import 'package:test_desktop/widgets/master_screen.dart';
import 'package:test_desktop/utils/dialogs.dart';
import 'package:test_desktop/widgets/story_widget.dart';

import '../models/story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StoryProvider _storyProvider;
  List<Story> stories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storyProvider=context.read<StoryProvider>();
   // _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return MasterScreen(
      titleWidget: 'Home Page',
      body:Padding(
        padding: EdgeInsets.all(5.0),
        child: 
          Center(
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return StoryWidget(naslov: story.naslov ?? "No title",
                                  aktivna: story.aktivna ?? false,
                                  novcaniCilj: story.novcaniCilj);
              },
            )
          )
        ),
      );
  }
  
  Future<void> _loadData() async{
    final response = await _storyProvider.getAll();
    if(response.list.isNotEmpty){
      setState(() {
        stories = response.list;
      });
    }
  }
}

