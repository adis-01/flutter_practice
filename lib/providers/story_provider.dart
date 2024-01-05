import 'package:test_desktop/providers/base_provider.dart';

import '../models/story.dart';

class StoryProvider extends BaseProvider<Story>{
  StoryProvider() : super("Price");
  
  @override
  Story fromJson(Map<String,dynamic> json) => Story.fromJson(json);
}