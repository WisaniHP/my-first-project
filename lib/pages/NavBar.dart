import 'package:flutter/material.dart';
import 'package:login_page/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/pages/searchBar.dart';
import 'package:login_page/pages/Setting.dart';
import 'package:login_page/pages/profile.dart';
import 'package:login_page/pages/bar.dart';



class NavBar extends StatefulWidget{
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  int currentTab= 0;
  final List<Widget>screens =[
    HomePage(),
    SearchBar(),
    SettingBar(),
    ProfileBar(),
    Bar(),
  ];
  final PageStorageBucket bucket =PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: PageStorage(
    child: currentScreen,
    bucket: bucket),
    // floatingActionButton: FloatingActionButton(
    //   child: Icon(Icons.add),
    //   onPressed: (){
    //
    //   },
    //),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 10,
    child: Container(
    height: 60,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
      Row(children: [

        MaterialButton(onPressed: (){
          minWidth:400;
          setState((){
            currentScreen = HomePage();
            currentTab = 0;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,color: currentTab ==0 ?Colors.blue :Colors.grey,
            ),
            Text('Home',
            style: TextStyle(color: currentTab==0 ? Colors.blue : Colors.grey) ,)
          ],
        ),
        ),
        MaterialButton(onPressed: (){
          minWidth:40;
          setState((){
            currentScreen = ProfileBar();
            currentTab = 1;
          });
        },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person,color: currentTab ==1 ?Colors.blue :Colors.grey,
              ),
              Text('Profile',
                style: TextStyle(color: currentTab==1 ? Colors.blue : Colors.grey) ,)
            ],
          ),
        ),
        MaterialButton(onPressed: (){
          minWidth:40;
          setState((){
            currentScreen = SearchBar();
            currentTab = 2;
          });
        },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search,color: currentTab ==2 ?Colors.blue :Colors.grey,
              ),
              Text('Search',
                style: TextStyle(color: currentTab==2 ? Colors.blue : Colors.grey) ,)
            ],
          ),
        ),
        MaterialButton(onPressed: (){
          minWidth:40;
          setState((){
            currentScreen = SettingBar();
            currentTab = 3;
          });
        },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings,color: currentTab ==3 ?Colors.blue :Colors.grey,
              ),
              Text('Settings',
                style: TextStyle(color: currentTab==3 ? Colors.blue : Colors.grey) ,)
            ],
          ),
        ),
        // MaterialButton(onPressed: (){
        //   minWidth:40;
        //   setState((){
        //     currentScreen = Bar();
        //     currentTab = 4;
        //   });
        // },
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.settings,color: currentTab ==0 ?Colors.blue :Colors.grey,
        //       ),
        //       Text('Settings',
        //         style: TextStyle(color: currentTab==0 ? Colors.blue : Colors.grey) ,)
        //     ],
        //   ),
        // )
      ],)


    ]

    ),
    ),
    ),
    );
    //   Drawer(
  // child: ListView(
  //   children: [
  //     UserAccountsDrawerHeader(
  //       accountName: Text(""),
  //       accountEmail:Text("LOGGED IN As "+"  "+user.email!),
  //     currentAccountPicture: CircleAvatar(
  //       child:  CircleAvatar(
  //         //child: Image.network(""),
  //       ),
  //     ),
  //     ),
  //     ListTile(
  //       leading: Icon(Icons.search),
  //       title: Text("Search"),
  //       onTap: ()=>null,
  //
  //     ),
  //     ListTile(
  //       leading: Icon(Icons.settings),
  //       title: Text("Settings"),
  //       onTap: ()=>null,
  //
  //     ),
  //     ListTile(
  //       leading: IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
  //       title: Text("Logout"),
  //       //onTap: ()=>null,
  //     ),
  //
  //
  //   ],
  // ),
  //
  //   );
  }
}
