import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walpaper/Network/wallpaper_network.dart';
import 'package:walpaper/Screens/category.dart';
import 'package:walpaper/Screens/home.dart';
import 'package:walpaper/Screens/profile.dart';

import '../Model/latestModel.dart';


class landing_page extends StatefulWidget {
  const landing_page({Key? key}) : super(key: key);

  @override
  State<landing_page> createState() => _landing_pageState();
}
List <Photo>Latest=[];
List <Photo>Category=[];
class _landing_pageState extends State<landing_page> {
  int _currentIndex = 0;
  int pageCount =3;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Category=await WallpaperNetwork().getCategoryWallpaper();
    Latest= await WallpaperNetwork().getLatestWallpaper();
    setState(() {});

  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      home_page(Latest: Latest,),
      category_page(Category: Category,),
      profile(),
    ];
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(_currentIndex==0
              ?"Home"
              :_currentIndex==1
              ?"Category"
              :"Profile",style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          actions: [
            if( _currentIndex!=2)IconButton(
                onPressed: (){},
                icon: Icon(Icons.search,
                color: Colors.black,
                )
            )
          ],
          centerTitle: _currentIndex==2?true:false,
        ),
        body:  _pages[_currentIndex],

        bottomNavigationBar: CupertinoTabBar(
          // elevation: 0,
          // selectedItemColor: Colors.white,
          // unselectedItemColor: Colors.black,

          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(Icons.home,color: Colors.white,
                size: 24,
                ),
              ),
              icon: Icon(Icons.home,color: Colors.black,),
              backgroundColor: Colors.white,
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(Icons.category,color: Colors.white,
                  size: 24,
                ),
              ),
              backgroundColor: Colors.white,
              icon: Icon(Icons.category,color: Colors.black,),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(Icons.person,color: Colors.white,
                  size: 24,
                ),
              ),
              backgroundColor: Colors.white,
              icon: Icon(Icons.person,color: Colors.black),
              label: '',
            ),
          ],

        ),
      ),
    );
  }
}