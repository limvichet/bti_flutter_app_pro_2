import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../logics/cpd_activity_favorite_logic.dart';
import '../logics/cpd_activity_logic.dart';
import '../models/cpd_activity_model.dart';
import 'about_screen.dart';
import 'cpd_activity_favorite_screen.dart';
import 'cpd_activity_screen_detail.dart';
import 'package:badges/badges.dart' as badges;

import 'cpd_activity_welcome_sceen.dart';
import 'home_screen.dart';

class CpdActivityScreen extends StatefulWidget {
  const CpdActivityScreen({super.key});

  @override
  State<CpdActivityScreen> createState() => _CpdActivityScreenState();
}

class _CpdActivityScreenState extends State<CpdActivityScreen> {
  bool _isSearch = false;
  List<Course> _listSearchItems = [];
  List<Course> listItems = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration(seconds: 1), () {
        context.read<CpdActivityLogic>().enableLoading();
        context.read<CpdActivityLogic>().fetch();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int numOfFavorite = context.watch<FavoriteCpdActivityLogic>().numOfFavorite;
    bool smallToBigSorted = context.watch<CpdActivityLogic>().smallToBigSorted;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff34a0bc),
        title: _buildSearchTextField(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavoriteCpdActivityScreen(),
                ),
              );
            },
            icon: badges.Badge(
              badgeContent: Text(
                "$numOfFavorite",
                style: TextStyle(color: Colors.white),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: numOfFavorite > 0 ? Colors.pink : Colors.white30,
              ),
              child: numOfFavorite > 0
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
              badgeAnimation: badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                context.read<CpdActivityLogic>().toggleSortByDate();
              },
              icon: smallToBigSorted != true
                  ? Icon(Icons.sort_sharp)
                  : Icon(Icons.sort_by_alpha_sharp)),
        ],
      ),
      // body: _isSearch ? _buildBodySearch() : _buildBody(),
      body: _builBB(),
      //bottomNavigationBar: _buildBodyIndexedStack(),
    );
  }

  Widget _buildBodyIndexedStack() {
    return IndexedStack(
      index: _currentPage,
      children: [HomeScreen(), AboutScreen(), WelcomeSceen()],
    );
  }

  Widget _builBB(){
    return _isSearch ? _buildBodySearch() : _buildBody();
  }

  Widget _buildBodySearch() {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _listSearchItems.length,
        itemBuilder: (context, index) {
          return _buildItemList(_listSearchItems[index]);
        },
      ),
    );
  }

  Widget _buildBody() {
    bool loading = context.watch<CpdActivityLogic>().loading;
    String? errorMessage = context.watch<CpdActivityLogic>().errorMessage;

    debugPrint("loading: $loading");

    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (errorMessage != null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(errorMessage),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CpdActivityLogic>().fetch();
            },
            child: Text("Retry"),
          ),
        ],
      ));
    } else {
      List<Course> items =
          context.watch<CpdActivityLogic>().cpdActivity.data.courses;
      listItems = items;
      return _builditems(items);
    }
  }

  Widget _builditems(List<Course> items) {
    if (items == null) {
      return Center(
        child: Text("Something went wrong"),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CpdActivityLogic>().fetch();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items!.length,
        itemBuilder: (context, index) {
          return _buildItemList(items[index]);
        },
      ),
    );
  }

  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildItemList(Course item) {
    bool isFavorite =
        context.watch<FavoriteCpdActivityLogic>().isFavorite(item);
    return Slidable(
      key: ValueKey(0),
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              debugPrint("Share");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (ctx) {
              debugPrint("Delete");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Delete',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (ctx) {
              debugPrint("Edit");
            },
            backgroundColor: Color(0xFF6FED79),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 100,
            child: Image.asset(
              "images/logo.png",
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CpdActivityScreenDetail(item),
              ),
            );          
          },
          title: Text(
            "${item.cpdCourseEn}",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registration date ${item.startDate}",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${item.learningOptionEn}",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text("${item.durationHour}hours ${item.credits}credits"),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              context.read<FavoriteCpdActivityLogic>().toggle(item);
            },
            icon: isFavorite
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Cpd Activity Course",
        hintStyle: const TextStyle(color: Colors.white30),
        prefixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white60,
          ),
          onPressed: () {},
        ),
        border: InputBorder.none,
      ),
      //keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.send,
      onChanged: (keyword) {
        if (keyword.isEmpty) {
          _isSearch = false;
          setState(() {});
        }
        if (keyword.isNotEmpty) {
          _isSearch = true;
          setState(() {});
        }
        _listSearchItems = listItems
            .where((item) => item.cpdCourseEn.toLowerCase().contains(keyword))
            .toList();
      },
    );
  }

  int _currentPage = 1;
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff34a0bc),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      currentIndex: _currentPage,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Help&Guide',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Services',
        ),
      ],
    );
  }
}
