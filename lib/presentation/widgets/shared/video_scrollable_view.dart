import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_bottons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index){
          final VideoPost videoPost = videos[index];

          return Stack(
            children: [
              
              //Videos,
              SizedBox.expand(
                child: FullScreenPlayer( 
                  videoUrl: videoPost.videoUrl,
                  caption: videoPost.caption,
                ),
              ),

              //Botones
              Positioned(
                bottom: 20,
                right: 20,
                child: VideoBottons(video: videoPost)
              )
            ],
          );
        },
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        
      ),
    );
  }
}