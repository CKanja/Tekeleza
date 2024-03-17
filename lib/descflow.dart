// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:tekeleza/findwater.dart';
import 'package:tekeleza/location2.dart';
import 'package:tekeleza/models/waterpoints.dart';

import 'package:tekeleza/waterquality.dart';

import 'location-findbycoord.dart';

class DescccWidget extends StatefulWidget {
  final int id;

  const DescccWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<DescccWidget> createState() => _DescccWidgetState();
}

class _DescccWidgetState extends State<DescccWidget> {
  late ExpandableController _expandableController;

  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController(initialExpanded: false);
  }

  @override
  Widget build(BuildContext context) {
    WaterPoint? waterPoint = WaterPoint.pointList.firstWhere(
      (point) => point.pointId == widget.id,
      // orElse: () => null,
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FindWater(),
                ),
              );
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      Text(
                        'Water Point Details',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Readex Pro',
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            '${waterPoint.imageURL}',
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    color: Colors.grey[200],
                    child: ExpandablePanel(
                      controller: _expandableController,
                      header: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          '${waterPoint.name}',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      collapsed: Container(
                        height: 60,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'By protecting and preserving our oceans, we can effectively reduce global warming as healthy...',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Readex Pro',
                                color: Colors.black),
                          ),
                        ),
                      ),
                      expanded: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 12),
                            child: Text(
                              'By protecting and preserving our oceans, we can effectively reduce global warming as healthy oceans absorb a significant amount of atmospheric carbon dioxide. Implementing measures to prevent overfishing, reducing plastic pollution, and conserving marine habitats will contribute to a balanced ocean ecosystem, ultimately mitigating global warming.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      theme: const ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: false,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 12,
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    'Water Flow Rate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Readex Pro',
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Steady',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Readex Pro',
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    'Water Quality',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Readex Pro',
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Safe for drinking',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Readex Pro',
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    'Status',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Readex Pro',
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.circle_sharp,
                        color: Colors.green,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Text(
                        'Active',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Readex Pro',
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckQuality(), // Replace YourNextPage with the page you want to navigate to
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlue],
                          stops: [0, 1],
                          begin: AlignmentDirectional(-1, 0),
                          end: AlignmentDirectional(1, 0),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Check Quality',
                        // style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(
                              latitude: waterPoint.latitude,
                              longitude: waterPoint.longitude,
                            ),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(
                        //   // color: Colors.white,
                        //   // width: 2,
                        // ),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'View in Map',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                      ),
                    ),
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
