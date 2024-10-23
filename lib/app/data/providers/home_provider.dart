import 'dart:io';

import 'package:get/get.dart';
import 'package:sims_ppob/app/data/models/banner_model.dart';
import 'package:sims_ppob/app/data/models/service_model.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class HomeProvider extends BaseProvider {
  Future<Response> getProfile() async => await get('/profile');

  Future<Response> getBalance() async => await get('/balance');
  Future<List<Service>> getServices() async {
    try {
      var res = await get('/services');
      if (res.statusCode == HttpStatus.ok) {
        return MyUtils.fromJsonList<Service>(
            res.body['data'], Service.fromJson);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
    return [];
  }

  Future<List<Banner>> getBanners() async {
    try {
      var res = await get('/banner');
      if (res.statusCode == HttpStatus.ok) {
        return MyUtils.fromJsonList<Banner>(res.body['data'], Banner.fromJson);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
    return [];
  }
}
