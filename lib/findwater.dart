// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tekeleza/descflow.dart';

import 'package:tekeleza/location.dart';
import 'package:tekeleza/location2.dart';
import 'package:tekeleza/models/waterpoints.dart';

import 'package:tekeleza/homeflow.dart';

void main() {
  runApp(FindWater());
}

class FindWater extends StatefulWidget {
  @override
  _FindWaterState createState() => _FindWaterState();
}

class _FindWaterState extends State<FindWater> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: const Color(0xFF1A5377),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeUserWidget(),
                ),
              );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Find Water Points',
            style: TextStyle(
              fontFamily: 'DM',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: const Color(0xFF1A5377),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapDirectionScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_outlined),
              color: const Color(0xFF1A5377),
              iconSize: 30,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => Detailsfr()),
                //   MaterialPageRoute(builder: (context) => DescccWidget(id: waterPoint.pointId))
                // );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: WaterPoint.pointList.length,
          itemBuilder: (context, index) {
            return WaterPointCard(
              waterPoint: WaterPoint.pointList[index],
            );
          },
        ),
      ),
    );
  }
}

class WaterPointCard extends StatelessWidget {
  final WaterPoint waterPoint;

  const WaterPointCard({
    required this.waterPoint,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page with the id parameter
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescccWidget(id: waterPoint.pointId),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.white,
            height: 150,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        waterPoint.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        waterPoint.status,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    // width: 5,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFF0095D6), // Set the color of the border
                        width: 2.0, // Set the width of the border
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      waterPoint.distance,
                      style: const TextStyle(
                        color: Color(0xFF0095D6),
                        fontSize: 11,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey, // Customize the color of the divider
            thickness: 0.8, // Adjust the thickness of the divider
            height: 0, // Height of the divider (space above and below)
          ),
        ],
      ),
    );
  }
}
