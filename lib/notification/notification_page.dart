import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mindplex/drawer/top_user_profile_icon.dart';
import 'package:mindplex/notification/controller/notification_controller.dart';
import 'package:mindplex/notification/widgets/notification_card_widget.dart';

import '../auth/auth_controller/auth_controller.dart';
import '../blogs/blogs_controller.dart';

import '../profile/user_profile_controller.dart';
import '../utils/constatns.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  BlogsController blogsController = Get.put(BlogsController());
  ProfileController profileController = Get.find();
  NotificationController notificationController = Get.find();
  AuthController authController = Get.find();

  GlobalKey<ScaffoldState> globalkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color(0xFF0c2b46),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 5, 32, 54),
              height: height * 0.20,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopUserProfileIcon(
                        profileController: profileController,
                        authController: authController),
                    SizedBox(
                      width: width * 0.14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: height * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: height * 0.20 * 0.25,
                        //   // width: 200,
                        //   decoration: BoxDecoration(
                        //       color: Color.fromARGB(59, 166, 166, 174),
                        //       borderRadius: BorderRadius.circular(12)),

                        //   child: TabBar(
                        //       indicator: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(12),
                        //           color: const Color.fromARGB(255, 49, 153, 167)),
                        //       isScrollable: true,
                        //       controller: tabController,
                        //       tabs: [
                        //         Tab(
                        //           child: Container(
                        //             width: 80,
                        //             child: Text(
                        //               "All",
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //         ),
                        //         Tab(
                        //           child: Container(
                        //             width: 80,
                        //             child: Text(
                        //               "Mentions",
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //         ),
                        //       ]),
                        // )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => notificationController.firstTimeLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: height * 0.80,
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          Container(
                            height: 510,
                            child: ListView.builder(
                                controller: notificationController
                                    .notificationPageScrollController,
                                shrinkWrap: true,
                                itemCount: notificationController
                                        .notificationList.length +
                                    1,
                                itemBuilder: (ctx, index) {
                                  notificationController
                                      .firstTimeLoading.value = false;
                                  if (index <
                                      notificationController
                                          .notificationList.length)
                                    return NotificationCard(
                                      notification: notificationController
                                          .notificationList[index],
                                    );
                                  else {
                                    if (index ==
                                            notificationController
                                                .notificationList.length &&
                                        !notificationController
                                            .reachedEndofNotifications.value) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }
                                }),
                          ),
                          Container(
                            height: height * 0.795,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: notificationController
                                    .notificationList.length,
                                itemBuilder: (ctx, index) {
                                  return NotificationCard(
                                    notification: notificationController
                                        .notificationList[index],
                                  );
                                }),
                          ),
                        ]),
                  )),
          ],
        ),
      ),
    );
  }
}
