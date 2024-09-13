import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(SportsVideoApp());
}

class SportsVideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SportsVideoScreen(),
    );
  }
}

class SportsVideoScreen extends StatefulWidget {
  @override
  _SportsVideoScreenState createState() => _SportsVideoScreenState();
}

class _SportsVideoScreenState extends State<SportsVideoScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;

  @override
  void initState() {
    super.initState();

    // Initialize the video players from assets
    _controller1 = VideoPlayerController.asset('assets/video1.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure UI updates after initialization
      });

    _controller2 = VideoPlayerController.asset('assets/video2.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure UI updates after initialization
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sports',
          style: TextStyle(
            color: Colors.blue, // Text color set to blue
            fontWeight: FontWeight.bold, // Bold font weight
            fontSize: 22, // Font size adjusted to match the design
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true, // Center the title in the AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'There Has Been Growing Concern In Australia And '
                    'Internationally About The Incidence Of Sport-Related '
                    'Concussion And Potential Health Ramifications For Athletes...',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              Text(
                'THE TRUE PRICE OF CONCUSSION IN RUGBY',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              buildVideoPlayer(_controller1),
              SizedBox(height: 24),
              Text(
                'US HIGH SCHOOL FOOTBALL',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              buildVideoPlayer(_controller2),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create the video player widget
  Widget buildVideoPlayer(VideoPlayerController controller) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller.value.isInitialized
              ? controller.value.aspectRatio
              : 16 / 9,
          child: controller.value.isInitialized
              ? VideoPlayer(controller)
              : Center(child: CircularProgressIndicator()),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
