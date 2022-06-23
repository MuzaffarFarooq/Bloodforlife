// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:get/get.dart';
import 'Blood Banks/Blood Banks.dart';
import 'History/history.dart';
import 'Make Request/makerequest.dart';
import 'SignIn/sign_in.dart';
import 'View Requests/viewrequest.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentPage = 0;
  final _pageController = PageController();
  late String _title;
  @override
  initState() {
    _title = 'Requests';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          _title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Sign_In());
              // FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.purple,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 310,
                color: Colors.deepPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/person.png'),
                          radius: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Blood for Life",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.backup,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Backup"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.restore,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Restore"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.star,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Rate us"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.person_add,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Invite a friend"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.mail,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Feedback"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.info,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("App Info"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Exit"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          ViewRequest(),
          MakeRequest(),
          BloodBanks(),
          History(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.notification_important_rounded),
            title: const Text('View Requests'),
            activeColor: Colors.red,
            activeTitleColor: Colors.blue.shade600,
          ),
          const BottomBarItem(
            icon: Icon(Icons.add_alert_sharp),
            title: Text('Make Request'),
            activeColor: Colors.blueAccent,
          ),
          BottomBarItem(
            icon: const Icon(Icons.home_work_sharp),
            title: const Text('Blood Banks'),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.greenAccent.shade700,
          ),
          BottomBarItem(
            icon: const Icon(Icons.history_rounded),
            title: const Text('History'),
            activeColor: Colors.deepPurple,
            activeIconColor: Colors.orange.shade600,
            activeTitleColor: Colors.orange.shade700,
          ),
        ],
      ),
    );
  }
}
