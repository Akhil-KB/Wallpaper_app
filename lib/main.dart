import 'package:flutter/material.dart';
import 'Screens/landing.dart';


void main() {
  runApp(
      MaterialApp(
        initialRoute: 'landing_page',
        routes:{
          'landing_page': (ctx)=> const landing_page(),
        },
        debugShowCheckedModeBanner: false,
      )
  );
}