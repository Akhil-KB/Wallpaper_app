import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:shimmer/shimmer.dart';
class ApplyWallpaper extends StatefulWidget {
  String link;
  ApplyWallpaper({super.key,required this.link});

  @override
  State<ApplyWallpaper> createState() => _ApplyWallpaperState();
}

class _ApplyWallpaperState extends State<ApplyWallpaper> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 550,
                  child: OptimizedCacheImage(
                    imageUrl: widget.link,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F101828),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x19101828),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!, // Replace with your desired base color
                      highlightColor: Colors.grey[100]!, // Replace with your desired highlight color
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
