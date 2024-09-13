import 'package:flutter/material.dart';

void main() {
  runApp(PrivacyPolicyApp());
}

class PrivacyPolicyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrivacyPolicyScreen(),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
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
        title: Text('Privacy Policy',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last Update: 14/08/2024',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. '
                    'Aenean in sagittis magna, et feugiat diam. Fusce a scelerisque neque, sed accumsan metus.\n\n'
                    'Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. '
                    'Aenean arcu metus, bibendum at rhoncus at, volutpat at lacus. Morbi pellentesque malesuada eros semper ultricies. '
                    'Vestibulum lobortis enim vel neque auctor, a ultricies ex placerat. Mauris ut lacinia justo, sed suscipit tortor.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 12),
              buildTermsConditionItem(
                '1. Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci.',
              ),
              buildTermsConditionItem(
                '2. Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci.',
              ),
              buildTermsConditionItem(
                '3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Aenean in sagittis magna, et feugiat diam.',
              ),
              buildTermsConditionItem(
                '4. Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat at lacus. Morbi pellentesque malesuada eros semper ultricies.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTermsConditionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}
