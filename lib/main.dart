import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tallerflutteraniei/widgets/course_widget.dart';
import 'package:solar_icons/solar_icons.dart';

import 'widgets/event_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String selectedValue = 'New York';
  final List<String> options = <String>[
    'New York',
    'California',
    'Texas',
    'Florida',
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    DropdownButton<String>(
                      value: selectedValue,
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      items: options
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                    const Text('within 20 miles'),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar.jpeg'),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Hello, Simone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Text(
              'There are 25 new\nevents in your area.',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xffC2A3DF),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for an event',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'You might like',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CourseWidget(
                      month: 'NOV',
                      day: index % 2 == 0 ? '20' : '28',
                      courseType: index % 2 == 0 ? 1 : 2,
                      image: index % 2 == 0
                          ? 'assets/cooking.jpg'
                          : 'assets/miguel_angel.jpg',
                      startDate: '10:00',
                      endDate: '19:30',
                      courseName: index % 2 == 0
                          ? 'Learn to cook with Amanda'
                          : 'Guided tour at the Sistine',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  'You might like',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const EventWidget(
              month: 'NOV',
              day: '20',
              image: 'assets/cooking.jpg',
              isFinalEvent: false,
            ),
            const EventWidget(
              month: 'NOV',
              day: '28',
              image: 'assets/miguel_angel.jpg',
              isFinalEvent: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(SolarIconsOutline.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(SolarIconsOutline.chatLine),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(SolarIconsOutline.gps),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SolarIconsOutline.bell,
            ),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SolarIconsOutline.hamburgerMenu,
            ),
            label: 'Menu',
          ),
        ],
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
