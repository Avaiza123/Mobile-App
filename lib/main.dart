import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _timeString = '';
  String _dateString = '';
  int _currentIndex = 0; // For BottomNavigationBar index

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
  }

  void _getCurrentTime() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _timeString = _formatTime(DateTime.now());
        _dateString = _formatDate(DateTime.now());
      });
    });
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  String _formatDate(DateTime dateTime) {
    return "${_getDayName(dateTime.weekday)}, ${dateTime.day.toString().padLeft(2, '0')} ${_getMonthName(dateTime.month)}";
  }

  String _getDayName(int dayNumber) {
    switch (dayNumber) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  // Handles BottomNavigationBar tab selection
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? PageView(
        scrollDirection: Axis.vertical,
        children: [
          // First page with time and date
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _timeString,
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _dateString,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Second page with grid of icons
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: AppBar(
                backgroundColor: Colors.grey[800],
                elevation: 0,
                title: Text(
                  _timeString,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                centerTitle: false,
                actions: [
                  Row(
                    children: [
                      Icon(Icons.wifi, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.signal_cellular_alt, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.battery_full, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/download.png', // Load the image from assets
                            width: 80,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Google',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 19),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.mic, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 10,
                    children: [
                      gradientIconTile(Icons.camera_alt, "Camera", Colors.purple, Colors.blue, context),
                      gradientIconTile(Icons.chrome_reader_mode_rounded, "Chrome", Colors.orange, Colors.red, context),
                      gradientIconTile(Icons.photo, "Photos", Colors.blue, Colors.green, context),
                      gradientIconTile(Icons.play_arrow, "YouTube", Colors.red, Colors.red, context),
                      gradientIconTile(Icons.map, "Maps", Colors.green, Colors.teal, context),
                      gradientIconTile(Icons.phone, "Phone", Colors.indigo, Colors.purple, context),
                      gradientIconTile(Icons.message, "Messages", Colors.orange, Colors.amber, context),
                      gradientIconTile(Icons.settings, "Settings", Colors.blueGrey, Colors.purpleAccent, context),
                      gradientIconTile(Icons.whatshot, "Whatshot", Colors.orange, Colors.tealAccent, context),
                      gradientIconTile(Icons.account_circle_outlined, "Account", Colors.tealAccent, Colors.green, context),
                      gradientIconTile(Icons.access_alarm, "Clock", Colors.amber, Colors.pinkAccent, context),
                      gradientIconTile(Icons.abc_rounded, "Text", Colors.deepOrangeAccent, Colors.lightBlue, context),
                      gradientIconTile(Icons.add, "Add", Colors.pink, Colors.blue, context),
                      gradientIconTile(Icons.access_time_filled_rounded, "Time", Colors.orangeAccent, Colors.grey, context),
                      gradientIconTile(Icons.wallet, "Wallet", Colors.purple, Colors.cyanAccent, context),
                      gradientIconTile(Icons.wallet_giftcard, "Gifts", Colors.blueGrey, Colors.tealAccent, context),
                      gradientIconTile(Icons.wallet_travel, "Travel", Colors.blue, Colors.deepPurple, context),
                      gradientIconTile(Icons.pageview, "Search", Colors.red, Colors.green, context),
                      gradientIconTile(Icons.label_important_rounded, "Label", Colors.blueGrey, Colors.pinkAccent, context),
                      gradientIconTile(Icons.offline_bolt_rounded, "Power", Colors.yellow, Colors.green, context),
                      gradientIconTile(Icons.radar_outlined, "Radar", Colors.blue, Colors.orange, context),
                      gradientIconTile(Icons.tab_rounded, "Files", Colors.blueGrey, Colors.brown, context),
                      gradientIconTile(Icons.cabin_rounded, "Hotel", Colors.deepOrangeAccent, Colors.green, context),
                      gradientIconTile(Icons.add_chart_rounded, "Chart", Colors.pinkAccent, Colors.grey, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
          : _buildAppsPage(), // Display apps page if current index is 1
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Apps',
          ),
        ],
      ),
    );
  }

  Widget _buildAppsPage() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40), // Reduced height of the AppBar
        child: AppBar(
          title: Text('Apps'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/download.png', // Load the image from assets
                      width: 80,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Google',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.mic, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          // You can add your additional content for the Apps page here
        ],
      ),
    );
  }

  // Gradient icon tile with label outside the tile
  Widget gradientIconTile(IconData icon, String label, Color startColor, Color endColor, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () {
              // Handle button press
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You clicked on $label')),
              );
            },
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
