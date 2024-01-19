import 'models/adacana_model.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/core/app_export.dart';
import 'provider/adacana_provider.dart';

class AdacanaScreen extends StatefulWidget {
  const AdacanaScreen({Key? key}) : super(key: key);

  @override
  AdacanaScreenState createState() => AdacanaScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AdacanaProvider(), child: AdacanaScreen());
  }
}

class AdacanaScreenState extends State<AdacanaScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginOrSignupScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 325.v,
                          width: 238.h,
                          onTap: () {
                            onTapImgLogo(context);
                          })
                    ]))));
  }

  /// Navigates to the loginOrSignupScreen when the action is triggered.
  onTapImgLogo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginOrSignupScreen,
    );
  }
}
