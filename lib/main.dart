import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ClickCounterScreen(),
    TwitterScreen(),
    FacebookScreen(),
    CourtCounterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.blue,
        elevation: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.twitter), label: "Twitter"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.facebook), label: "Facebook"),
          BottomNavigationBarItem(icon: Icon(Icons.sports_basketball), label: "Court"),
        ],
      ),
      ),
    );
  }
}

// ----------------- Screen 1 ------------------
class ClickCounterScreen extends StatefulWidget {
  @override
  State<ClickCounterScreen> createState() => _ClickCounterScreenState();
}

class _ClickCounterScreenState extends State<ClickCounterScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Click Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: Icon(Icons.add),
      ),
    );
  }
}

// ----------------- Screen 2 ------------------
class TwitterScreen extends StatelessWidget {
  const TwitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Icon(
          FontAwesomeIcons.twitter,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ----------------- Screen 3 ------------------
class FacebookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF1877F2),
              child: Icon(
                FontAwesomeIcons.f,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                Text(
                  'FACEBOOK',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(FontAwesomeIcons.facebook, size: 20, color: Colors.black54),
                    SizedBox(width: 15),
                    Icon(Icons.messenger, size: 20, color: Colors.black54),
                    SizedBox(width: 15),
                    Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.black54),
                    SizedBox(width: 15),
                    Icon(FontAwesomeIcons.whatsapp, size: 20, color: Colors.black54),
                    SizedBox(width: 15),
                    Icon(FontAwesomeIcons.meta, size: 20, color: Colors.black54),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Screen 4 ------------------
class CourtCounterScreen extends StatefulWidget {
  @override
  State<CourtCounterScreen> createState() => _CourtCounterScreenState();
}

class _CourtCounterScreenState extends State<CourtCounterScreen> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoints(String team, int points) {
    setState(() {
      if (team == 'A') teamAScore += points;
      else teamBScore += points;
    });
  }

  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  Widget scoreColumn(String team, int score, void Function(int) onAdd) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Team $team', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('$score', style: TextStyle(fontSize: 48)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onAdd(3),
            child: Text('+3 POINTS'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
          ElevatedButton(
            onPressed: () => onAdd(2),
            child: Text('+2 POINTS'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
          ElevatedButton(
            onPressed: () => onAdd(1),
            child: Text('FREE THROW'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Court Counter'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                scoreColumn('A', teamAScore, (points) => addPoints('A', points)),
                VerticalDivider(thickness: 1),
                scoreColumn('B', teamBScore, (points) => addPoints('B', points)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: resetScores,
              child: Text('RESET'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
