import 'package:flutter/material.dart';

void main() {
  runApp(PCSScreenApp());
}

class PCSScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PCSScreen(),
    );
  }
}

class PCSScreen extends StatelessWidget {
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
          'PCS',
          style: TextStyle(
            color: Colors.blue, // Heading color
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 22, // Font size
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Definition',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Post-Concussion Syndrome (PCS) Is A Complex Disorder In '
                          'Which Various Symptoms — Such As Headaches And Dizziness — '
                          'Last For Weeks And Sometimes Months After The Injury That '
                          'Caused The Concussion.\n\n'
                          'Concussion Is A "mild" Traumatic Brain Injury, Usually Occurring '
                          'After A Blow To The Head. Loss Of Consciousness Isn’t Required '
                          'For A Diagnosis Of Concussion Or Post-Concussion Syndrome. In '
                          'Fact, The Risk Of Post-Concussion Syndrome Doesn’t Appear To Be '
                          'Associated With The Severity Of The Initial Injury.\n\n'
                          'In Most People, Post-Concussion Syndrome Symptoms Occur Within '
                          'The First Seven To 10 Days And Go Away Within Three Months, '
                          'Though They Can Persist For A Year Or More.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    'assets/pcs.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Causes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Some Experts Believe Post-Concussion Symptoms Are Caused By '
                    'Structural Damage To The Brain Or Disruption Of Neurotransmitter Systems, '
                    'Resulting From The Impact That Caused The Concussion.\n\n'
                    'Others Believe Post-Concussion Symptoms Are Related To Psychological '
                    'Factors, Especially Since The Most Common Symptoms — Headache, Dizziness '
                    'And Sleep Problems — Are Similar To Those Often Experienced By People '
                    'Diagnosed With Depression, Anxiety Or Post-Traumatic Stress Disorder (PTSD).',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              Text(
                'Symptoms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'PCS May Include A Cluster Of Physical And Cognitive Symptoms That Sometimes '
                    'Occur After Minor Head Injury. These Include:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 8),
              bulletPointText('Dizziness'),
              bulletPointText('Poor Memory And Concentration'),
              bulletPointText('Headaches'),
              bulletPointText('Fatigue'),
            ],
          ),
        ),
      ),
    );
  }

  Widget bulletPointText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
