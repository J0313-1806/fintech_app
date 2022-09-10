import 'package:fintech_app/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsWeb extends StatelessWidget {
  const SettingsWeb({Key? key}) : super(key: key);

  static final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, homeConstraints) {
      return Scaffold(
        body: Row(
          children: <Widget>[
            buildHome(controller: controller, homeConstraints: homeConstraints),
            homeConstraints.maxWidth > 800
                ? buildNotification(
                    controller: controller, homeConstraints: homeConstraints)
                : const Center(),
          ],
        ),
        backgroundColor: Colors.black,
      );
    });
  }

  buildHome(
      {required HomeController controller,
      required BoxConstraints homeConstraints}) {
    return Expanded(
      flex: Get.width > 1084 ? 2 : 6,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.grey.shade700,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: homeConstraints.maxWidth > 600
                ? Get.height - 70
                : Get.height - 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 26, 26),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey.shade800,
              ),
            ),
            child: ListView(
              children: <Widget>[
                const Text(
                  'TITLE',
                  style: TextStyle(fontSize: 22),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height / 4,
                  child: Row(
                    children: [
                      Container(
                        height: homeConstraints.maxWidth > 1146
                            ? Get.height / 4
                            : Get.height / 5.5,
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
                            // Obx(
                            //   () =>
                            Row(
                              children: List.generate(
                                4,
                                (index) => Container(
                                  margin: homeConstraints.maxWidth > 1000
                                      ? const EdgeInsets.fromLTRB(
                                          10, 20, 10, 10)
                                      : const EdgeInsets.fromLTRB(5, 10, 5, 5),
                                  padding: homeConstraints.maxWidth > 1000
                                      ? const EdgeInsets.fromLTRB(
                                          10, 10, 25, 10)
                                      : const EdgeInsets.fromLTRB(
                                          10, 10, 15, 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: index == 3
                                            ? const Color.fromARGB(
                                                255, 26, 26, 26)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        '14,522',
                                        style: TextStyle(fontSize: 18),
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
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
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
                  height: Get.height / 1.4,
                  child: Obx(
                    () => controller.loader.value
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : controller.homeDataList.isNotEmpty
                            ? Scrollbar(
                                showTrackOnHover: true,
                                hoverThickness: 5.0,
                                thickness: 5.0,
                                controller: controller.scrollController,
                                child: ListView.builder(
                                  controller: controller.scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: 5.0, bottom: 5.0, right: 10.0),
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 8, 5, 70),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade700),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: const Color.fromARGB(
                                            255, 39, 38, 38),
                                      ),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.ads_click,
                                          color: Colors.amber.shade800,
                                        ),
                                        title: Text(
                                          controller.homeDataList[index].title
                                              .substring(0, 10),
                                        ),
                                        trailing: Text(
                                            '${controller.homeDataList[index].id}'),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const Center(
                                child: Text(
                                  'No Data Found',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildNotification({
    required HomeController controller,
    required BoxConstraints homeConstraints,
  }) {
    return Expanded(
      flex: Get.width > 1084 ? 2 : 3,
      child: AnimatedContainer(
        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 10),
        duration: const Duration(seconds: 1),
        // height: Get.height - 200,
        width: Get.width / 2,
        decoration: const BoxDecoration(color: Colors.black),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'NOTIFICATIONS',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => controller.loader.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : controller.homeDataList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade700),
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: const Color.fromARGB(255, 39, 38, 38),
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    color: Colors.amber.shade800,
                                  ),
                                  title: Text(
                                    controller.homeDataList[index].body,
                                  ),
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
            ),
            homeConstraints.maxWidth > 1050
                ? Container(
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Expanded(
                      flex: 1,
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
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 180,
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 0, 20, 0),
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
                                    height: 30,
                                  ),
                                  const Text('Last updated on'),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const <Widget>[
                                          Text('Current Value'),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text('XIRR Return %'),
                                        ],
                                      ),
                                      Container(
                                        height: 70,
                                        margin: const EdgeInsets.fromLTRB(
                                            80, 0, 80, 0),
                                        padding: const EdgeInsets.all(1.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const <Widget>[
                                          Text('Invested Value'),
                                          SizedBox(
                                            height: 30,
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.newspaper,
                                color: Colors.amber.shade700,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Folio',
                                style: TextStyle(
                                  color: Colors.amber.shade700,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            width: Get.width - 20,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade700,
                            ),
                          ),
                          const Text(
                            'Your Investments',
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}
