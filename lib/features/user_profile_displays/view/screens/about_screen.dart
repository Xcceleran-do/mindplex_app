import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:mindplex/features/user_profile_displays/controllers/user_profile_controller.dart';
import 'package:mindplex/utils/colors.dart';

import '../widgets/user_interest_widget.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  ProfileController profileController = Get.find();

  Widget build(BuildContext context) {
    final decodedBiography =
        parse(profileController.userProfile.value.biography ?? "")
            .documentElement!
            .text;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: blogContainerColor,
      ),
      padding: EdgeInsets.all(16),
      child: Obx(
        () => profileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                shrinkWrap: true,
                children: [
                  TitleText(text: 'Biography'),
                  SizedBox(
                    height: 10,
                  ),
                  Html(
                    data: decodedBiography,
                    style: {
                      '*': Style(color: Colors.white),
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(text: 'Education'),
                          SizedBox(height: 10),
                          Text(
                            profileController.userProfile.value.education !=
                                    null
                                ? profileController.userProfile.value.education!
                                    .educationalBackground
                                : "",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(text: 'Age'),
                          SizedBox(
                            height: 10,
                          ),
                          profileController.userProfile.value.age != null
                              ? Text(
                                  profileController.userProfile.value.age
                                          .toString() +
                                      ' years',
                                  style: const TextStyle(color: Colors.white),
                                )
                              : Tooltip(
                                  message: "Private data",
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(text: 'Sex'),
                          SizedBox(
                            height: 10,
                          ),
                          profileController.userProfile.value.gender != null
                              ? Text(
                                  profileController.userProfile.value.gender
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
                                )
                              : Tooltip(
                                  message: "Private data",
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TitleText(text: 'Interest'),
                  SizedBox(
                    height: 10,
                  ),
                  UserInterest(profileController: profileController),
                  SizedBox(
                    height: 10,
                  ),
                  TitleText(text: 'Social'),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: profileController
                          .userProfile.value.socialLink!.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: profileGolden,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: width * 0.75,
                                child: Text(
                                  profileController
                                      .userProfile.value.socialLink![index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          color: profileGolden,
          fontWeight: FontWeight.w700,
        ),
      );
}
