import 'package:fintech_app/app/controller/home_controller.dart';
import 'package:fintech_app/app/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static final HomeController controller = Get.put(HomeController());
  static final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    // return GetX<HomeController>(
    //   init: HomeController(),
    //   builder: (controller) {
    return Scaffold(
      body: ListView(
        primary: false,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            height: Get.width / 2,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 25, 10),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color:
                                      index == 2 ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                            child: Column(
                              children: const <Widget>[
                                Text(
                                  '14,522',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('SCORE'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height / 1.85,
            child: Obx(
              () => controller.loader.value
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : controller.homeDataList.isNotEmpty
                      ? ListView.builder(
                          // controller: controller.scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.homeDataList.length - 80,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.fromLTRB(5, 8, 5, 70),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(255, 39, 38, 38),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    controller.homeDataList[index].title
                                        .substring(0, 10),
                                  ),
                                  Text('${controller.homeDataList[index].id}'),
                                ],
                              ),
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
          )
        ],
      ),
      backgroundColor: Colors.black,
      //   );
      // },
    );
  }
}
