import 'package:flutter/material.dart';
import 'package:football/constants/colors.dart';
import 'package:football/services.dart/mongodb_service.dart';

class AddDrillScreen extends StatelessWidget {
  final drillNameController = TextEditingController();
  final countController = TextEditingController();

  Future<void> addDrill() async {
    final drillName = drillNameController.text;
    final count = int.parse(countController.text);

    await MongoDBService.drillsCollection.insert({
      'drillName': drillName,
      'count': count,
      'userId': 'user1_id', // Replace with dynamic user ID
    });

    print('Drill added!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: AppColor.gradientFirst,
        title: Text('Add Drill',
            style: TextStyle(color: AppColor.secondPageTitleColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: drillNameController,
              decoration: InputDecoration(
                labelText: 'Drill Name',
                labelStyle: TextStyle(color: AppColor.homePageIcons),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gradientSecond),
                ),
              ),
            ),
            TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Count',
                labelStyle: TextStyle(color: AppColor.homePageIcons),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gradientSecond),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addDrill,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.gradientFirst,
                foregroundColor: AppColor.homePageContainerTextBig,
              ),
              child: Text('Add Drill'),
            ),
          ],
        ),
      ),
    );
  }
}
