import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/core/app_export.dart';
import 'package:mynotes/core/utils/validation_functions.dart';
import 'package:mynotes/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:mynotes/widgets/app_bar/appbar_title.dart';
import 'package:mynotes/widgets/app_bar/custom_app_bar.dart';
import 'package:mynotes/widgets/custom_elevated_button.dart';
import 'package:mynotes/widgets/custom_text_form_field.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 11.v),
                    child: Container(
                        margin: EdgeInsets.only(bottom: 5.v),
                        padding: EdgeInsets.symmetric(horizontal: 32.h),
                        child: Column(children: [
                          _buildPageHeader(context),
                          SizedBox(height: 21.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgLogoGray5001113x116,
                              height: 113.v,
                              width: 116.h),
                          SizedBox(height: 115.v),
                          Selector<LoginProvider, TextEditingController?>(
                              selector: (context, provider) =>
                                  provider.emailController,
                              builder: (context, emailController, child) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "lbl_email2".tr,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_email"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    borderDecoration: TextFormFieldStyleHelper
                                        .outlineOnPrimaryTL14);
                              }),
                          SizedBox(height: 24.v),
                          Selector<LoginProvider, TextEditingController?>(
                              selector: (context, provider) =>
                                  provider.passwordController,
                              builder: (context, passwordController, child) {
                                return CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "lbl_password".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_password"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    borderDecoration: TextFormFieldStyleHelper
                                        .outlineOnPrimaryTL14);
                              }),
                          SizedBox(height: 26.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPasswor(context);
                                  },
                                  child: Text("msg_forgot_password".tr,
                                      style: CustomTextStyles
                                          .labelLargeSecondaryContainerSemiBold))),
                          SizedBox(height: 23.v),
                          CustomElevatedButton(
                              text: "lbl_next".tr,
                              onPressed: () {
                                onTapNext(context);
                              }),
                          SizedBox(height: 33.v),
                          GestureDetector(
                              onTap: () {
                                onTapDonTHaveAnAccount(context);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text(
                                            "msg_don_t_have_an_account".tr,
                                            style: theme.textTheme.labelLarge)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 8.h),
                                        child: Text("lbl_signup2".tr,
                                            style: CustomTextStyles
                                                .labelLargeSecondaryContainerSemiBold))
                                  ]))
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 32.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarTitle(
              text: "lbl_login".tr,
              margin: EdgeInsets.symmetric(horizontal: 48.h, vertical: 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: 221.h,
          margin: EdgeInsets.only(right: 89.h),
          child: Text("msg_this_is_your_community".tr,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displaySmall!.copyWith(height: 1.18))),
      SizedBox(height: 1.v),
      Container(
          width: 282.h,
          margin: EdgeInsets.only(right: 28.h),
          child: Text("msg_our_community_is3".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(height: 1.67)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPasswor(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapDonTHaveAnAccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
