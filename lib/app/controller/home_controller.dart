import 'dart:developer';

import 'package:fintech_app/app/api/service.dart';
import 'package:fintech_app/app/model/json_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    getNotificationData();

    super.onReady();
  }

  ScrollController scrollController = ScrollController();
  RxList<Model> homeDataList = RxList([]);
  RxBool loader = RxBool(false);
  RxBool isBig = RxBool(Get.width > 800 ? true : false);
  RxInt scoreIndex = RxInt(3);

  // checks screen size
  void mediaQuery() {
    if (isBig.value) {
      scoreIndex(4);
    } else {
      scoreIndex(3);
    }
  }

// stores data in observable list
  void getNotificationData() async {
    try {
      loader(true);
      var data = await Api.modelData();
      if (data.isNotEmpty) {
        homeDataList.assignAll(data);
      } else {
        homeDataList.clear();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loader(false);
    }
  }
}
