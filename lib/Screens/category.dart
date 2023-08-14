import 'package:flutter/material.dart';

import '../Model/latestModel.dart';
import '../Widgets/CategoryCardWidget.dart';
class category_page extends StatefulWidget {
  List<Photo> Category;
 category_page({Key? key,required this.Category}) : super(key: key);

  @override
  State<category_page> createState() => _category_pageState();
}

class _category_pageState extends State<category_page> {
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.70,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0, // Add vertical spacing between items
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {

                  return Column(
                    children: [
                      CategoryCardWidget(link:widget.Category[index].src.portrait,Category: "Abstract",),
                    ],
                  );
                },
                itemCount: widget.Category.length,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
