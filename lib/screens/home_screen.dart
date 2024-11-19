import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_app/screens/login_screen.dart';
import 'package:flutter_auth_provider_app/screens/user_detail_screen.dart';
import 'package:flutter_auth_provider_app/screens/screen4.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'cpd_activity_app.dart';
import 'screen3.dart';
import 'screen5.dart';
import 'screen6.dart';
import 'screen7.dart';
import 'screen8.dart';
import 'screen9.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({super.key});
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _username = '';
  String _email = '';
  String _userid = '';

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = prefs.getString("username")!;
    _email = prefs.getString("email")!;
    _userid = prefs.getString("userid")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _username = '';
    _email = '';
    _userid = '';
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(context),
      //bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  final List<Widget> pages = [
    userDetailWithProvider(),
    cpdActivityAppWithProvider(),
    Screen3(),
    Screen4(),
    Screen5(),
    Screen6(),
    Screen7(),
    Screen8(),
    Screen9(),

    // Add Page3 to Page9 here
  ];

  var services = [
    "View Profile",
    "Search CPD",
    "View CPD",
    "View Credits",
    "Leave Requests",
    "Confirm CPD",
    "TCP Apprasal",
    "View Apprasal",
    "Transfer Requests",
  ];

  var images = [
    "images/icons/profile.png",
    "images/icons/search.png",
    "images/icons/file.png",
    "images/icons/eye-exam.png",
    "images/icons/logout.png",
    "images/icons/verified.png",
    "images/icons/create.png",
    "images/icons/apprise.png",
    "images/icons/transfer.png",
  ];

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff34a0bc),
      centerTitle: true,
      title: const Text(
        'HRCPD',
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/moeys.png'),
        ),
      ],
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff34a0bc),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/photo_1.jpg'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username: $_username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'User ID: $_userid',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    'Email: $_email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // Handle password change
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(LoginScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 245, 233, 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'images/teacher.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'images/quote.png',
                        height: 200, // Increase this value to make it larger
                        width: 200, // Increase this value to make it larger
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'images/using-a-mobile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
                child: Container(
              child: Center(
                child: _buildGridMenu(context),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final int crossAxisCount = 3; // Number of columns
    final double itemHeight =
        MediaQuery.of(context).size.height / 7.1; // Height of each grid item
    final double itemWidth = MediaQuery.of(context).size.width /
        crossAxisCount; // Width of each grid item

    return GridView(
      physics: NeverScrollableScrollPhysics(), // Prevent scrolling
      shrinkWrap:
          true, // Makes the GridView only occupy the space needed by its children
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: itemWidth / itemHeight,
      ),
      children: List.generate(services.length, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pages[index],
              ),
            );
          },
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  images[index],
                  height: 40,
                  width: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(
                      10), // Reduced padding to fit content better
                  child: Text(
                    services[index],
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        height: 1.2,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
