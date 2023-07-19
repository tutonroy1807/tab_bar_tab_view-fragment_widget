



import 'package:flutter/material.dart';
import 'package:tab_bar_view_fragement/Fragement/CallFragment.dart';
import 'package:tab_bar_view_fragement/Fragement/HomeFragement.dart';
import 'package:tab_bar_view_fragement/Fragement/MessageFragment.dart';
import 'package:tab_bar_view_fragement/Fragement/PersonFragment.dart';
import 'package:tab_bar_view_fragement/Fragement/SearchFragment.dart';
import 'package:tab_bar_view_fragement/Fragement/SettingFragment.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(title: Text("TabBar Of View"),
            titleSpacing: 30,
            elevation: 20,
            actions: [
              IconButton(onPressed: (){
                MySnackBar("ACCOUNT DETAILS", context);
              }, icon: Icon(Icons.account_box)),
              IconButton(onPressed: (){
                MySnackBar("Personal Information", context);
              }, icon: Icon(Icons.account_circle_sharp)),
              IconButton(onPressed: (){
                MySnackBar("Alert button", context);
              }, icon: Icon(Icons.add_alert_rounded))


            ],

            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.home),text: "HOME",),
                Tab(icon: Icon(Icons.add_call),text: "CALL",),
                Tab(icon: Icon(Icons.message), text: "MESSAGE",),
                Tab(icon: Icon(Icons.search), text: "SEARCH",),
                Tab(icon: Icon(Icons.settings), text: "SETTING",),
                Tab(icon: Icon(Icons.person), text: "PERSON",)
              ],
            ),

          ),

          body: TabBarView(
            children: [
                  HomeFragement(),
                  CallFragment(),
                  MessageFragment(),
                  PersonFragement(),
                  SearchFragement(),
                  SettingFragement()
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 2,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Information")
              ],

              onTap: (int index){
                if(index == 0){
                  MySnackBar("Its Homebutton", context);
                }
                if(index == 1){
                  MySnackBar("Search here", context);
                }
                if(index == 2){
                  MySnackBar("PERSONAL INFORMATION", context);
                }
              }

          ),
        )

    );
  }
































}

