import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football/Screens/add_drill_screen.dart';
import 'package:football/Screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../constants/colors.dart' as color;

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.logout_outlined,
                    size: 20, color: color.AppColor.homePageIcons),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AddDrillScreen());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                  color.AppColor.gradientSecond.withOpacity(0.9)
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                      color: color.AppColor.gradientSecond.withOpacity(0.4))
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Drill",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    Text(
                      "Circular Drill",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    Text(
                      "with your Boosting Drill",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: const Offset(4, 8))
                              ]),
                          child: const Icon(Icons.play_circle_fill,
                              color: Colors.white, size: 60),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 1),
            InkWell(
              onTap: () {
                Get.to(DashboardScreen());
              },
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/card.jpg",
                            ),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3)),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("DashBoard (Your Records)",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: color.AppColor.homePageDetail)),
                          const SizedBox(
                            height: 18,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "See your Results",
                              style: TextStyle(
                                color: color.AppColor.homePagePlanColor,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of Focus",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: color.AppColor.homePageTitle),
                )
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: (info.length.toDouble() / 2).toInt(),
                  itemBuilder: (_, i) {
                    int a = 2 * i;
                    int b = 2 * i + 1;
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(AddDrillScreen());
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            height: 170,
                            margin: const EdgeInsets.only(
                              left: 30,
                              bottom: 15,
                            ),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(171, 213, 255, 1),
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[a]["img"]),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1)),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(info[a]["title"],
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(AddDrillScreen());
                          },
                          child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                left: 30,
                                bottom: 15,
                              ),
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(171, 213, 255, 1),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(info[b]["img"]),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1)),
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1)),
                                ],
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(info[b]["title"],
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
