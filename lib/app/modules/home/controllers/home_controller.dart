import 'package:get/get.dart';
import 'package:sims_ppob/app/data/models/banner_model.dart';
import 'package:sims_ppob/app/data/models/service_model.dart';
import 'package:sims_ppob/app/data/models/user_model.dart';
import 'package:sims_ppob/app/data/providers/home_provider.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> gridItems = [
    {'title': 'PBB', 'image': 'assets/images/PBB.png'},
    {'title': 'Listrik', 'image': 'assets/images/Listrik.png'},
    {'title': 'Pulsa', 'image': 'assets/images/Pulsa.png'},
    {'title': 'PDAM', 'image': 'assets/images/PDAM.png'},
    {'title': 'PGN', 'image': 'assets/images/PGN.png'},
    {'title': 'Lainnya', 'image': 'assets/images/Televisi.png'},
    {'title': 'Musik', 'image': 'assets/images/Musik.png'},
    {'title': 'Game', 'image': 'assets/images/Game.png'},
    {'title': 'Makanan', 'image': 'assets/images/Makanan.png'},
    {'title': 'Kurban', 'image': 'assets/images/Kurban.png'},
    {'title': 'Zakat', 'image': 'assets/images/Zakat.png'},
    {'title': 'Data', 'image': 'assets/images/Data.png'},
  ];

  List<String> slider = [
    'assets/images/Banner 1.png',
    'assets/images/Banner 2.png',
    'assets/images/Banner 3.png',
    'assets/images/Banner 4.png',
    'assets/images/Banner 5.png',
  ];
  RxList<Service> services = <Service>[].obs;
  RxList<Banner> banners = <Banner>[].obs;
  Rx<User> user = User().obs;
  RxInt balance = 0.obs;

  final _provider = Get.find<HomeProvider>();

  @override
  void onInit() async {
    super.onInit();
    await getInfo();
    if (Box.user != null) {
      user.value = Box.user!;
    }
  }

  Future<void> getInfo() async {
    try {
      services.clear();
      banners.clear();
      if (Box.user == null) {
        var resProfile = await _provider.getProfile();
        await Box.setUser(resProfile.body['data']);
      }
      var res = await _provider.getBalance();
      balance.value = res.body['data']['balance'] as int;
      services.addAll(await _provider.getServices());
      banners.addAll(await _provider.getBanners());
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }
}
