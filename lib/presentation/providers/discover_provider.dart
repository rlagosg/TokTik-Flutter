import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
//import 'package:toktik/domain/shared/data/local_video_post.dart';
//import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';


class DiscoverProvider extends ChangeNotifier {

  final VideoPostsRepositoryImpl videosRespository;
  DiscoverProvider({required this.videosRespository});

  bool initialLoading = true;
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async {
    // todo: cargar videos
    await Future.delayed( const Duration( seconds: 2));
     
    // final List<VideoPost> newVideos = videoPosts.map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    final newVideos = await videosRespository.getTrendingVideosByPage(1);

    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();
  }

}