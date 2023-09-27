import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    "https://images.unsplash.com/photo-1688345779794-99a4d0917381?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3538&q=80",
    "https://images.unsplash.com/photo-1688295598146-028a57f4c939?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3514&q=80",
    "https://images.unsplash.com/photo-1512100356356-de1b84283e18?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2507&q=80",
    "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3546&q=80",
    "https://images.unsplash.com/photo-1568790869636-3e519e51f263?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3056&q=80"
  ];
  final List<String> string = [
    "Simple",
    "Parallax",
    "Effect",
    "With",
    "Matrix Translation"
  ];

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        // log("pixel${scrollController.position.pixels.toString()}");
        // log("pixel${scrollController.position.pixels.toString()}");
        return Container(
          decoration: BoxDecoration(),
          height: size.height,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Container(
                transform: Matrix4.identity()
                  ..translate(
                      0.0,
                      scrollController.hasClients
                          ? (-(index * size.height) +
                              scrollController.position.pixels)
                          : 0.0),
                width: double.maxFinite,
                height: size.height,
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  string[index],
                  style: GoogleFonts.kaushanScript(
                      fontSize: 55, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: images.length,
    ));
  }
}
