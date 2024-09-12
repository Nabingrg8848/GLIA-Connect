import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpCenterScreen(),
      debugShowCheckedModeBanner: false, // Hide the debug banner
    );
  }
}

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  bool isFaqSelected = true;
  String selectedTab = 'Popular Topic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Color(0xFF3B74F2), // Match the blue color
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Back button functionality
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Help Center',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 48), // Space to balance the row
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'How Can We Help You?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Adjust for spacing
                ],
              ),
            ),
          ),
          Padding( // Added padding here
            padding: const EdgeInsets.only(top: 16.0), // Padding above the buttons
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFaqSelected = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        color: isFaqSelected ? Color(0xFF3B74F2) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                          color: isFaqSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFaqSelected = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        color: !isFaqSelected ? Color(0xFF3B74F2) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: !isFaqSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isFaqSelected) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabButton('Popular Topic'),
                  _buildTabButton('General'),
                  _buildTabButton('Services'),
                ],
              ),
            ),
          ],
          Expanded(
            child: isFaqSelected ? _buildFaqContent() : _buildContactUsContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqContent() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text('$selectedTab Question ${index + 1}?', style: TextStyle(fontWeight: FontWeight.bold)),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '$selectedTab content for question ${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a.',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactUsContent() {
    return ListView(
      children: [
        _buildContactOption(Icons.headset, 'Customer Service'),
        _buildContactOption(Icons.public, 'Website'),
        _buildContactOption(Icons.chat, 'Whatsapp'),
        _buildContactOption(Icons.facebook, 'Facebook'),
        _buildContactOption(Icons.photo_camera, 'Instagram'),
      ],
    );
  }

  Widget _buildTabButton(String title) {
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3B74F2) : Color(0xFFDCE3F7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF3B74F2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(IconData icon, String title) {
    return ExpansionTile(
      leading: Icon(icon, color: Color(0xFF3B74F2)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem.',
          ),
        ),
      ],
    );
  }
}
