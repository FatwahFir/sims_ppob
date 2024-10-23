import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/modules/home/widgets/grid_item.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/balance_widget.dart';
import 'package:sims_ppob/app/shared/components/loading_indicator.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.isTrue
            ? const LoadingIndicatior()
            : RefreshIndicator(
                color: Themes.primaryColor,
                onRefresh: () => controller.getInfo(),
                child: CustomScrollView(
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
                            InkWell(
                              onTap: () {
                                // Box.session.erase();
                                // Get.offAllNamed(Routes.AUTH);
                                controller.balance.value += 100000;
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    const AssetImage(MyPath.profileImage),
                                backgroundColor: Themes.white,
                              ),
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
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22),
                                ),
                                Text(
                                  "${controller.user.value.firstName} ${controller.user.value.lastName}",
                                  style: Get.textTheme.displayLarge
                                      ?.copyWith(fontSize: 26),
                                ),
                                const Gap.v(h: 30),
                                BalanceWidget(
                                  balance: controller.balance.value,
                                  isShowToggleBtn: true,
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6, // Number of items in a row
                              crossAxisSpacing:
                                  0.0, // Minimal horizontal spacing between items
                              mainAxisSpacing: 20.0,
                              childAspectRatio: (40 / 50),
                            ),
                            itemCount: controller.services.length,
                            itemBuilder: (context, index) {
                              final data = controller.services;
                              return GestureDetector(
                                onTap: () => Get.toNamed(
                                  Routes.PAYMENT,
                                  arguments: {
                                    'item': controller.services[index]
                                  },
                                ),
                                child: GridItem(
                                  title: data[index].serviceName ?? '-',
                                  image: data[index].serviceIcon ?? '-',
                                ),
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
                                        controller.banners.length,
                                        (index) => SizedBox(
                                              width: Get.width * 0.6,
                                              height: 120,
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                        .banners[index]
                                                        .bannerImage ??
                                                    '-',
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                                .marginSymmetric(horizontal: 3)
                                                .marginOnly(
                                                    left: index == 0 ? 10 : 0))
                                    .toList(),
                              ).marginSymmetric(horizontal: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
