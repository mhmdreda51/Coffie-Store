import 'package:align_positioned/align_positioned.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffie/services/coffee_service.dart';
import 'package:coffie/splash_screen.dart';
import 'package:coffie/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiLight);

    return GetBuilder<CoffieServices>(
      init: CoffieServices(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppTheme.secondaryBg,
            child: Column(
              children: [
                Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16),
                      child: SvgPicture.asset('assets/images/icon_drawer.svg'),
                    )),
                Expanded(
                  flex: 80,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            child: Text(
                              'Welcome back, Alex',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: AppTheme.subTitleTextColor),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 240,
                            margin: EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 8, left: 16, right: 16),
                                  child: Text('Your favourites',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                ),
                                Expanded(
                                  flex: 100,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: GetBuilder<CoffieServices>(
                                      init: CoffieServices(),
                                      builder: (controller) => ListView.builder(
                                        padding: EdgeInsets.only(left: 16),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.categoryModel.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 16, 16, 16),
                                            child: AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: Card(
                                                margin: EdgeInsets.zero,
                                                elevation: 0,
                                                clipBehavior: Clip.antiAlias,
                                                color: AppTheme.secondaryBg2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppTheme.radius),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: AlignPositioned(
                                                          touch: Touch.inside,
                                                          moveByChildWidth:
                                                              -0.5,
                                                          child: CachedNetworkImage(
                                                              imageUrl: controller
                                                                  .categoryModel[
                                                                      index]
                                                                  .image),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        child:
                                                            FractionallySizedBox(
                                                          widthFactor: 0.55,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: AutoSizeText(
                                                            controller
                                                                .categoryModel[
                                                                    index]
                                                                .name,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3,
                                                            textAlign:
                                                                TextAlign.end,
                                                            maxLines: 3,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: InkWell(
                                                            splashFactory:
                                                                InkRipple
                                                                    .splashFactory,
                                                            splashColor: AppTheme
                                                                .shadow
                                                                .withOpacity(
                                                                    0.1),
                                                            onTap: () => null,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Text('New in the offer',
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          GetBuilder<CoffieServices>(
                            init: CoffieServices(),
                            builder: (controller) => ListView.builder(
                              padding: EdgeInsets.only(left: 16),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.productModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                                  height: 140,
                                  child: Card(
                                    elevation: 0,
                                    clipBehavior: Clip.antiAlias,
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Row(
                                            children: [
                                              AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: Card(
                                                  margin: EdgeInsets.zero,
                                                  elevation: 0,
                                                  clipBehavior: Clip.antiAlias,
                                                  color: AppTheme.secondaryBg2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppTheme.radius),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: AlignPositioned(
                                                      touch: Touch.inside,
                                                      moveByChildWidth: -0.3,
                                                      child: CachedNetworkImage(
                                                        imageUrl: controller
                                                            .productModel[index]
                                                            .image,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 16),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 20,
                                                        child: AutoSizeText(
                                                          controller
                                                              .productModel[
                                                                  index]
                                                              .name,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline3
                                                              .copyWith(
                                                                  color: AppTheme
                                                                      .subTitleTextColor),
                                                        ),
                                                      ),
                                                      Spacer(
                                                        flex: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 15,
                                                        child: FittedBox(
                                                          child: Text(
                                                            'from ' +
                                                                controller
                                                                    .productModel[
                                                                        index]
                                                                    .price
                                                                    .toString() +
                                                                '/cup',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .subtitle1
                                                                .copyWith(
                                                                    color: AppTheme
                                                                        .subTitleTextColor),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(
                                                        flex: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 25,
                                                        child: Container(
                                                          child: AutoSizeText(
                                                            controller
                                                                .productModel[
                                                                    index]
                                                                .description,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .subtitle2,
                                                            minFontSize: 10,
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(
                                                        flex: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 25,
                                                        child: Container(
                                                          height: 40,
                                                          child: AspectRatio(
                                                            aspectRatio: 3 / 1,
                                                            child: Card(
                                                              elevation: 0,
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          AppTheme
                                                                              .radius)),
                                                              color: AppTheme
                                                                  .secondary2,
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: FractionallySizedBox(
                                                                    widthFactor: 0.6,
                                                                    child: FittedBox(
                                                                        child: Text(
                                                                      'Take a look',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyText1
                                                                          .copyWith(
                                                                              color: Colors.white),
                                                                    ))),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              splashFactory:
                                                  InkRipple.splashFactory,
                                              splashColor: AppTheme.shadow
                                                  .withOpacity(0.1),
                                              onTap: () => null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppTheme.shadow,
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            -1.0, // Move to bottom 10 Vertically
                          ),
                        ),
                      ]),
                      child: Card(
                        elevation: 0,
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 25,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.3,
                                      heightFactor: 0.3,
                                      child: SvgPicture.asset(
                                          'assets/images/icon_home.svg'),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashFactory: InkRipple.splashFactory,
                                        splashColor:
                                            AppTheme.shadow.withOpacity(0.1),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, SplashScreen.routeName);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.3,
                                      heightFactor: 0.3,
                                      child: SvgPicture.asset(
                                          'assets/images/icon_category.svg'),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashFactory: InkRipple.splashFactory,
                                        splashColor:
                                            AppTheme.shadow.withOpacity(0.1),
                                        onTap: () => null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.3,
                                      heightFactor: 0.3,
                                      child: SvgPicture.asset(
                                          'assets/images/icon_checkout.svg'),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashFactory: InkRipple.splashFactory,
                                        splashColor:
                                            AppTheme.shadow.withOpacity(0.1),
                                        onTap: () => null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.3,
                                      heightFactor: 0.3,
                                      child: SvgPicture.asset(
                                          'assets/images/icon_settings.svg'),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashFactory: InkRipple.splashFactory,
                                        splashColor:
                                            AppTheme.shadow.withOpacity(0.1),
                                        onTap: () => null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
