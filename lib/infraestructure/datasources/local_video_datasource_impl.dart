import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/shared/data/local_video_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';

class LocalVideoDatasource implements VideoPostDatasource{

  @override
  Future<List<VideoPost>> getTFavoriteVideosByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {

    await Future.delayed( const Duration( seconds: 2));
    
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    return newVideos;
  }

}