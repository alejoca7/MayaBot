import 'package:flutter/material.dart';
import 'package:mayatraductor/core/app_export.dart';
import 'package:mayatraductor/widgets/custom_elevated_button.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 35.h,
            vertical: 50.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 84.v),
              Container(
                height: 271.adaptSize,
                width: 271.adaptSize,
                padding: EdgeInsets.symmetric(vertical: 60.v),
                decoration: AppDecoration.fillOnError.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder135,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgWappgptlogo,
                  width: 146.h,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 50.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 52.v,
                  width: 246.h,
                  margin: EdgeInsets.only(right: 19.h),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "MAYA",
                                style: CustomTextStyles.headlineLargeff3c096c,
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: "traductor",
                                style: CustomTextStyles.headlineLargeff7b2cbf,
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 6.adaptSize,
                          width: 6.adaptSize,
                          margin: EdgeInsets.only(
                            left: 94.h,
                            bottom: 14.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.pink300,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Text(
                "CONECTANDO CULTURAS",
                style: CustomTextStyles.titleSmallInterPurple9007f,
              ),
              Spacer(),
              CustomElevatedButton(
                text: "Iniciar",
                onPressed: () {
                  onTapIniciar(context);
                },
              ),
              SizedBox(height: 19.v),
              GestureDetector(
                onTap: () {
                  onTapRegistrarse(context);
                },
                child: Text(
                  "Regístrate",
                  style: CustomTextStyles.titleMediumHindSiliguriPink300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapIniciar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iniciarSesiNScreen);
  }

  void onTapRegistrarse(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}
