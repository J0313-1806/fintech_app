import 'dart:developer';
import 'package:fintech_app/app/api/service.dart';
import 'package:fintech_app/app/model/json_model.dart';
import 'package:fintech_app/app/mobile/home.dart';
import 'package:fintech_app/app/mobile/settings.dart';
import 'package:fintech_app/app/web/home_web.dart';
import 'package:fintech_app/app/web/settings_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  NavController({
    required this.constraints,
  });
  @override
  void onInit() {
    super.onInit();
    pageListOnScreenSize();
  }

  @override
  void onReady() {
    getNotificationData();
    super.onReady();
  }

  BoxConstraints constraints;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var pageC = PageController();

  RxInt pageIndex = RxInt(0);

//list of Pages
  RxList<Widget> pageList = RxList([]);

//assingning based on screen size
  void pageListOnScreenSize() {
    List<Widget> web = [
      const HomeWeb(),
      const SettingsWeb(),
    ];
    List<Widget> phone = [
      const HomeScreen(),
      const SettingsScreen(),
    ];
    if (constraints.maxWidth > 600) {
      pageList.assignAll(web);
    } else {
      pageList.assignAll(phone);
    }
  }

// changes page number
  void onNavChanged(int index) {
    pageIndex(index);
    if (constraints.maxWidth > 600) {
      pageC.jumpToPage(index);
    }
  }

//to open Drawer
  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

//to close Drawer
  closeDrawer() {
    Get.back();
  }

  RxList<Model> notificationList = RxList([]);
  RxBool loader = RxBool(false);

// stores data in observable list
  void getNotificationData() async {
    try {
      loader(true);
      var data = await Api.modelData();
      if (data.isNotEmpty) {
        notificationList.assignAll(data);
      } else {
        notificationList.clear();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loader(false);
    }
  }
}
