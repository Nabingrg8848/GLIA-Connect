import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // Import video player package
import 'ConcussionScreen.dart';
import 'PTSDScreen.dart';
import 'TBIScreen.dart';
import 'QuizScreen.dart';
import 'Profile.dart';
import 'HelpCenter.dart';
import 'LoginActivity.dart';
import 'PrivacyPolicy.dart';
import 'SportsScreen.dart';
import 'PCSScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  late VideoPlayerController _controller;
  int _currentVideoIndex = 0;
  final List<String> _videoPaths = [
    'assets/video1.mp4', // Replace with the paths of your actual videos
    'assets/video2.mp4',
    'assets/video3.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(_videoPaths[_currentVideoIndex])
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Auto-play the video once initialized
      });
  }

  void _playNextVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex + 1) % _videoPaths.length;
      _controller.dispose();
      _initializeVideoPlayer();
    });
  }

  void _playPreviousVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex - 1 + _videoPaths.length) % _videoPaths.length;
      _controller.dispose();
      _initializeVideoPlayer();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.blue),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              // Handle notifications button press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.blue),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  if (_controller.value.isInitialized)
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  else
                    Center(child: CircularProgressIndicator()), // Display a loading spinner if video isn't initialized
                ],
              ),
              VideoProgressIndicator(_controller, allowScrubbing: true),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.teal),
                    onPressed: _playPreviousVideo, // Handle previous video
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    onPressed: _playNextVideo, // Handle next video
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: _currentVideoIndex == 0 ? Colors.teal : Colors.grey,
                    radius: 5,
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: _currentVideoIndex == 1 ? Colors.teal : Colors.grey,
                    radius: 5,
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: _currentVideoIndex == 2 ? Colors.teal : Colors.grey,
                    radius: 5,
                  ),
                ],
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(context, 'assets/concussion.png', 'Concussion'),
                  _buildGridItem(context, 'assets/pcs.png', 'PCS'),
                  _buildGridItem(context, 'assets/ptsd.png', 'PTSD'),
                  _buildGridItem(context, 'assets/tbi.png', 'TBI'),
                  _buildGridItem(context, 'assets/quiz.png', 'Quiz'),
                  _buildGridItem(context, 'assets/sports.png', 'Sports'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Concussion') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConcussionScreen(userType: 'user')),
          );
        } else if (title == 'PCS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PCSScreen()),
          );
        } else if (title == 'Sports') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SportsVideoScreen()),
          );
        } else if (title == 'PTSD') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PTSDScreen()),
          );
        } else if (title == 'TBI') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TBIScreen()),
          );
        } else if (title == 'Quiz') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizScreen()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_pic.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.blue),
            title: Text('Favorite'),
            onTap: () {
              // Handle Favorite tap
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.blue),
            title: Text('Payment Method'),
            onTap: () {
              // Handle Payment Method tap
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.blue),
            title: Text('Privacy Policy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings tap
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text('Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpCenterScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue),
            title: Text('Logout'),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            color: Color(0xFFE0ECFF),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4C8C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFDCE5FF),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF007AFF),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginActivity()),
                      );
                    },
                    child: Text(
                      'Yes, Logout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
