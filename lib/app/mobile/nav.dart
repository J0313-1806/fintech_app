import 'package:fintech_app/app/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

class NavScreen extends StatelessWidget {
  NavScreen({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GetX<NavController>(
      init: NavController(constraints: constraints),
      initState: (c) {
        c.controller?.getNotificationData();
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/logo.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 32, 32),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(Get.context!).openEndDrawer();
                  controller.openDrawer();
                },
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
            ),
          ],
        ),
        body: controller.pageList[controller.pageIndex.value],
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.indicator,
          snakeViewColor: Colors.deepOrange,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          showSelectedLabels: true,
          currentIndex: controller.pageIndex.value,
          onTap: controller.onNavChanged,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
          ],
        ),
        endDrawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.fromLTRB(5, 55, 5, 15),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.notifications,
                      color: Colors.deepOrange,
                    ),
                    Text(
                      'Missed Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: controller.loader.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : controller.notificationList.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.all(5),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, drawIndex) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.person,
                                      color: Colors.amber.shade800,
                                    ),
                                    title: Text(
                                      controller
                                          .notificationList[drawIndex].title,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              'No Data Found',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
              ),
              Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.line_axis_outlined,
                        color: Colors.amber.shade900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(5.0, 0, 10, 0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Net Worth',
                              style: TextStyle(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Last updated on'),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text('Current Value'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('XIRR Return %'),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  padding: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text('Invested Value'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Gain/Loss'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.newspaper,
                          color: Colors.amber.shade900,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Folio',
                          style: TextStyle(
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 0, 4),
                      width: Get.width - 20,
                      height: 2.0,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade800,
                      ),
                    ),
                    const Text(
                      'Your Investments',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
