import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fintech_app/app/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavWeb extends StatelessWidget {
  NavWeb({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
        init: NavController(constraints: constraints),
        initState: (c) {
          c.controller?.pageList;
        },
        builder: (controller) {
          return Scaffold(
            body: Row(
              children: <Widget>[
                SideMenu(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                  items: [
                    SideMenuItem(
                      onTap: () => controller.onNavChanged(0),
                      title: "Home",
                      icon: const Icon(Icons.home),
                      priority: 0,
                    ),
                    SideMenuItem(
                      onTap: () => controller.onNavChanged(1),
                      title: "Settings",
                      icon: const Icon(Icons.settings),
                      priority: 1,
                    ),
                  ],
                  controller: controller.pageC,
                  style: SideMenuStyle(
                    displayMode: constraints.maxWidth > 1086
                        ? SideMenuDisplayMode.open
                        : SideMenuDisplayMode.compact,
                    openSideMenuWidth: 150,
                    selectedIconColor: Colors.deepOrange,
                    selectedTitleTextStyle: const TextStyle(
                      color: Colors.deepOrange,
                    ),
                    unselectedIconColor: Colors.white,
                    unselectedTitleTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageC,
                    children: controller.pageList,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.black,
          );
        });
  }
}
