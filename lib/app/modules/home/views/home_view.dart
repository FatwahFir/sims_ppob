import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/modules/home/widgets/grid_item.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Themes.white,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        MyPath.logo,
                        width: 20,
                      ),
                      const Gap.h(w: 5),
                      Text(
                        MyStrings.appName,
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: const AssetImage(MyPath.profileImage),
                    backgroundColor: Themes.white,
                  )
                ],
              ),
            ),
            expandedHeight: 320,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Themes.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap.v(h: 80),
                      Text(
                        '${MyStrings.wellcome},',
                        style: Get.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 22),
                      ),
                      Text(
                        'Fatwah Firmansyah',
                        style:
                            Get.textTheme.displayLarge?.copyWith(fontSize: 26),
                      ),
                      const Gap.v(h: 30),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Themes.red,
                                Themes.redDark,
                              ], // You can replace these with your desired colors
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: const [0.6, 1.0],
                            ),
                          ),
                          width: Get.width - 45,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                MyStrings.balance,
                                style: Get.textTheme.bodyLarge
                                    ?.copyWith(color: Themes.white),
                              ),
                              Text(
                                "Rp 10.000",
                                style: Get.textTheme.displayLarge?.copyWith(
                                    fontSize: 36, color: Themes.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Lihat Saldo",
                                    style: Get.textTheme.bodyMedium
                                        ?.copyWith(color: Themes.white),
                                  ),
                                  const Gap.h(w: 5),
                                  Icon(
                                    Icons.visibility_outlined,
                                    color: Themes.white,
                                    size: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 160,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, // Number of items in a row
                    crossAxisSpacing:
                        0.0, // Minimal horizontal spacing between items
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (40 / 50),
                  ),
                  itemCount: controller.gridItems.length,
                  itemBuilder: (context, index) {
                    return GridItem(
                      title: controller.gridItems[index]['title'],
                      image: controller.gridItems[index]['image'],
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temukan Produk Menarik",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ).marginOnly(left: 20),
                  const Gap.v(h: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          controller.slider.length,
                          (index) => SizedBox(
                                width: Get.width * 0.6,
                                height: 120,
                                child: Image.asset(
                                  controller.slider[index],
                                  fit: BoxFit.contain,
                                ),
                              ).marginSymmetric(horizontal: 3).marginOnly(
                                  left: index == 0 ? 10 : 0)).toList(),
                    ).marginSymmetric(horizontal: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
