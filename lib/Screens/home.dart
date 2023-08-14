import 'package:flutter/material.dart';
import 'package:walpaper/Network/wallpaper_network.dart';
import 'package:walpaper/Screens/wallpaperPage.dart';

import '../Model/latestModel.dart';
import '../Widgets/HomeCardWidget.dart';
class home_page extends StatefulWidget {
  List <Photo> Latest;
  home_page({Key? key,required this.Latest}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisSpacing: 20.0, // Add vertical spacing between items
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ApplyWallpaper(link: widget.Latest[index].src.portrait,)),
                        );
                      },
                      child: HomeCardWidget(link:widget.Latest[index].src.portrait));
                },
                itemCount: widget.Latest.length,
              ),


            ],
          ),
        ),
      ),
    );
  }
}