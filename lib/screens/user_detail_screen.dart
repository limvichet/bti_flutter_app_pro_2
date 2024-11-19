import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_app/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:provider/provider.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../logics/user_logic.dart';

Widget userDetailWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserLogic()),
    ],
    child: UserDetailScreen(),
  );
}

class UserDetailScreen extends StatefulWidget {
  //const UserDetailScreen({super.key});
 // late UserModel userModel;
  final String title = "ព័ត៌មានផ្ទាល់ខ្លួន";


  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final String profileImageUrl =
      'https://www.pngfind.com/pngs/m/317-3177131_636682202684372240-user-profile-photo-round-hd-png-download.png'; // Replace with user's profile image URL
  //final String userName = 'លី សុពុទ្ធា';
  final String email = 'puthea@example.com';
  final String phoneNumber = '+1 123 456 7890';
  final String department = 'នាយកដ្ឋានប្រព័ន្ធព័ត៌មានគ្រប់គ្រងអប់រំ';
  final String role = 'User'; // Adjust as per your role enum

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _userid = '';

  UserModel? user;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userid = prefs.getString("userid")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _userid = '';
    getSharedPrefs();
    if (mounted) {
      Future.delayed(Duration(seconds: 1), () {
        context.read<UserLogic>().enableLoading();
        context.read<UserLogic>().fetch(_userid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool loading = context.watch<UserLogic>().loading;
    String? errorMessage = context.watch<UserLogic>().errorMessage;

    user = context.watch<UserLogic>().userModel;

    print(user?.nameKh);

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ព័ត៌មានផ្ទាល់ខ្លួន'),
          ),
          body: Column(
            children: [
              _buildProfileHeader(),
              TabBar(
                isScrollable: true, // Make TabBar scrollable
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  _buildFixedSizeTab('ព័ត៌មានផ្ទាល់ខ្លួន'),
                  _buildFixedSizeTab('ឋានន្តរស័ក្តិ និងថ្នាក់'),
                  _buildFixedSizeTab('កម្រិតវប្បធម៌'),
                  _buildFixedSizeTab('កម្រិតវិជ្ជាជីវៈ'),
                  _buildFixedSizeTab('កំណត់'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildDetailsTab(), // First tab content
                    _buildActivityTab(), // Second tab content
                    _buildGenderalKnowledTab(), // Third tab content
                    _buildProfessionalTab(), // Third tab content
                    _buildSettingsTab(), // Third tab content
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Profile header with the profile image and username
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/photo_1.jpg'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.nameKh,
                // "hell",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height: 4), // Space between the name and department
              Text(
                user!.locationKh,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
        // subtitle
      ),
    );
  }

// Details Tab
  Widget _buildDetailsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.nameEn,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ឈ្មោះភាសាអង់គ្លេស'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
           user!.gender,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ភេទ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.dob.toString(),
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ថ្ងៃខែឆ្នាំកំណើត'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.dateOfStartingWork.toString(),
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ថ្ងៃខែចូលបម្រើការងារ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.locationKh,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('អង្គភាពបម្រើការងារ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.province,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ទីកន្លែងបម្រើការងារ'),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: Text(
            '+1 123 456 7890',
            style: GoogleFonts.nokora(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: const Text('លេខទូរស័ព្ទ'),
          // trailing: Icon(Icons.edit_document),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          title: Text(
            'ស្រុកកំពង់ចាម, ខេត្តកំពង់ចាម',
            style: GoogleFonts.nokora(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: const Text('ទីកន្លែងកំណើត'),
        ),
      ],
    );
  }

// General knowledge Tab
  Widget _buildGenderalKnowledTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.highestQualification,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('កម្រិតវប្បធម៌'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
           user!.highestQualificationSubject,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ឈ្មោះជំនាញ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.highestQualificationDate.toString(),
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('កាលបរិច្ឆេទទទួល'),
        ),
      ],
    );
  }

// Professional Tab
  Widget _buildProfessionalTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.highestProfessional,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('កម្រិតវិជ្ជាជីវៈ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
           user!.professional,
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('ឈ្មោះជំនាញ'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(
            user!.highestQualificationDate.toString(),
            style: GoogleFonts.nokora(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: const Text('កាលបរិច្ឆេទទទួល'),
        ),
      ],
    );
  }

// Activity Tab
  Widget _buildActivityTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text(" មុខតំណែង  ${user!.currentPosition}"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text("ប្រភេទកាំប្រាក់ ${user!.salaryLevelKh}"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text("ថ្នាក់ ${user!.salaryDegree}"),
        ),
        ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text('ថ្ងៃខែឆ្នាំដំឡើងកាំប្រាក់ ${user!.salaryTypeShiftDate.toString()}'),
        ),
        // Add more activity details here
      ],
    );
  }

// Settings Tab
  Widget _buildSettingsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Account Settings'),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text('Privacy Settings'),
        ),
        // Add more settings options here
      ],
    );
  }

  // Helper function to build a fixed-size tab
  Widget _buildFixedSizeTab(String label) {
    return Tab(
      child: Container(
        // width: 100, // Set fixed width for each tab
        alignment: Alignment.center,
        child: Text(label),
      ),
    );
  }
}
