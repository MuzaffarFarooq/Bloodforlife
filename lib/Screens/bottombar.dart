// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:bloodforlife/Screens/SignIn/sign_in.dart';
// import 'package:bottom_bar/bottom_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'Blood Banks/Blood Banks.dart';
// import 'History/history.dart';
// import 'Make Request/makerequest.dart';
// import 'View Requests/viewrequest.dart';
// import 'chat/chat.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({Key? key}) : super(key: key);
//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _selectedIndex = 0;
//   late String _title;
//   @override
//   // ignore: must_call_super
//   initState() {
//     _title = 'Chat';
//   }

//   // ignore: prefer_final_fields
//   static List<Widget> _widgetOptions = <Widget>[
//     Chat(),
//     ViewRequest(),
//     MakeRequest(),
//     BloodBanks(),
//     History(),
//   ];

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedIconTheme: IconThemeData(size: 28),
//         unselectedItemColor: Colors.grey,
//         unselectedFontSize: 16,
//         selectedFontSize: 20,
//         selectedIconTheme: IconThemeData(size: 30, color: Colors.black),
//         onTap: _onItemTapped,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notification_important_rounded),
//             label: 'View Requests',
//             // backgroundColor: Colors.green,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_alert_sharp),
//             label: 'Make Request',
//             // backgroundColor: Colors.purple,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_work_sharp),
//             label: 'Blood Banks',
//             // backgroundColor: Colors.purple,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history_rounded),
//             label: 'History',
//             // backgroundColor: Colors.purple,
//           ),
//         ],
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       switch (index) {
//         case 0:
//           {
//             _title = 'Chat';
//           }
//           break;
//         case 1:
//           {
//             _title = 'View Requests';
//           }
//           break;
//         case 2:
//           {
//             _title = 'Create Request';
//           }
//           break;
//         case 3:
//           {
//             _title = 'Blood Banks';
//           }
//           break;
//         case 4:
//           {
//             _title = 'History';
//           }
//           break;
//       }
//     });
//   }

//   showConfirmLogout() {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (context) => CupertinoActionSheet(
//         message: Text("Would you like to sign out?"),
//         actions: [
//           CupertinoActionSheetAction(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//             child: Text(
//               "Sign Out",
//               style: TextStyle(color: Colors.red),
//             ),
//           )
//         ],
//         cancelButton: CupertinoActionSheetAction(
//           child: Text("Cancel"),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//     );
//   }
// }
