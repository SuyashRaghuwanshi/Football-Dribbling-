import 'package:flutter/material.dart';
import 'package:football/constants/colors.dart';
import 'package:football/model/drill_model.dart';
import 'package:football/services.dart/mongodb_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Drill> drills = [];

  Future<void> fetchDrills() async {
    final data = await MongoDBService.drillsCollection.find().toList();
    setState(() {
      drills = data.map((d) => Drill.fromJson(d)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDrills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: AppColor.gradientFirst,
        title: Text('Dashboard',
            style: TextStyle(color: AppColor.secondPageTitleColor)),
      ),
      body: ListView.builder(
        itemCount: drills.length,
        itemBuilder: (context, index) {
          final drill = drills[index];
          return Card(
            color: AppColor.homePageDetail,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                drill.drillName,
                style: TextStyle(color: AppColor.homePageContainerTextBig),
              ),
              subtitle: Text(
                'Count: ${drill.count}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
