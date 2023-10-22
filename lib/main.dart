import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<bool> isSheetOpenNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/paris.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 25,
              top: 18,
              left: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle back button click.
                    },
                    child: Container(
                      height: 40,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Icon(
                          size: 40,
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 40,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Icon(
                          size: 40,
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: (context, controller) {
                controller.addListener(() {
                  if (controller.position.pixels <= 0) {
                    isSheetOpenNotifier.value = true;
                  } else {
                    isSheetOpenNotifier.value = false;
                  }
                });
                return Container(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 37),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rinjani Mountain",
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Lombok, Indonesia",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$48",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "/Person",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Preview",
                              style: TextStyle(fontSize: 24),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 18,
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "4.8",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/paris.jpg",
                                width: 100.0,
                                height: 100.0,
                              ),
                              SizedBox(width: 12),
                              Image.asset(
                                "assets/images/paris.jpg",
                                width: 100.0,
                                height: 100.0,
                              ),
                              SizedBox(width: 12),
                              Image.asset(
                                "assets/images/paris.jpg",
                                width: 100.0,
                                height: 100.0,
                              ),
                              SizedBox(width: 12),
                              Image.asset(
                                "assets/images/paris.jpg",
                                width: 100.0,
                                height: 100.0,
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia...",
                          style: TextStyle(fontSize: 14),
                        ),


                        SizedBox(
                          height: 36,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: isSheetOpenNotifier,
                builder: (context, child) {
                  return isSheetOpenNotifier.value
                      ? RoundButton() : FullSizeButton();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24), // Make it round
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            // Handle "Book Now" button click.
          },
          child: Center(
            child: Icon(
              Icons.book, // Add an icon to indicate booking
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FullSizeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 325,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            // Handle "Book Now" button click.
          },
          child: Center(
            child: Text(
              "Book Now",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}