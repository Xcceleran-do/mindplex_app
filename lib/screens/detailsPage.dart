import 'package:flutter/material.dart';
import 'package:mindplex_app/models/popularModel.dart';

class DetailsPage extends StatelessWidget {
  final PopularDetails details;
  const DetailsPage({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0c2b46),
      body: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 1, right: 5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/profile.PNG"),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .50,
                      margin: EdgeInsets.only(right: 3, top: 30),
                      child: Column(
                        children: [
                          Text(
                            details.profileName!,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "It's easier to fool people than to confince them that they've been fooled. I spent the last three years as a design Ethicist It's easier to fool people than to confince them that they've been fooled",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 30, right: 30, bottom: 10),
                    margin: EdgeInsets.only(top: 15),
                    decoration: const BoxDecoration(
                        color: Color(0xFF0f3e57),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/dImage.PNG"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 15,
                    child: details.state == "read"
                        ? const Icon(
                            Icons.description_outlined,
                            color: Color(0xFF8aa7da),
                            size: 30,
                          )
                        : details.state == "watch"
                            ? const Icon(
                                Icons.videocam,
                                color: Color.fromARGB(255, 185, 127, 127),
                                size: 30,
                              )
                            : const Icon(
                                Icons.headphones,
                                color: Colors.green,
                                size: 30,
                              ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  details.title!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 24, 200, 179)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  details.description!,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              )
            ],
          )),
      floatingActionButton: Container(
        width: 370,
        height: 100,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.only(left: 8),
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.cottage_sharp,
                  size: 40,
                  color: Colors.white,
                )),
            const Icon(
              Icons.search_outlined,
              size: 40,
              color: Colors.white,
            ),
            const Icon(
              Icons.notifications_outlined,
              size: 40,
              color: Colors.white,
            ),
            const Icon(
              Icons.email_outlined,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
