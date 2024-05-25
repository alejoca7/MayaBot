import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayatraductor/core/app_export.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_leading_image.dart';
import 'package:mayatraductor/widgets/app_bar/custom_app_bar.dart';
import 'package:mayatraductor/widgets/custom_elevated_button.dart';
import 'package:mayatraductor/widgets/custom_icon_button.dart';
import 'package:mayatraductor/widgets/custom_text_form_field.dart';

class IniciarSesiNScreen extends StatelessWidget {
  IniciarSesiNScreen({Key? key}) : super(key: key);

  TextEditingController checkmarkController = TextEditingController();
  TextEditingController hiddenATMNoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.h,
                    vertical: 36.v,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Iniciar Sesión",
                          style: CustomTextStyles.displaySmallPrimary,
                        ),
                      ),
                      SizedBox(height: 73.v),
                      CustomTextFormField(
                        controller: checkmarkController,
                        hintText: "Usuario",
                        textStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 122, 5, 255), // Color personalizado
                        ),
                        prefix: Container(
                          margin: EdgeInsets.only(
                            top: 1.v,
                            right: 13.h,
                            bottom: 17.v,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgCheckmark,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 42.v,
                        ),
                        contentPadding: EdgeInsets.only(right: 30.h),
                      ),
                      SizedBox(height: 26.v),
                      CustomTextFormField(
                        controller: hiddenATMNoController,
                        hintText: "****************",
                        textStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 122, 5, 255), // Color personalizado
                        ),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                          margin: EdgeInsets.only(
                            top: 4.v,
                            right: 13.h,
                            bottom: 16.v,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 44.v,
                        ),
                        suffix: Container(
                          margin: EdgeInsets.only(
                            left: 30.h,
                            top: 8.v,
                            bottom: 20.v,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgEye,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 44.v,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 13.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "¿Olvidó su contraseña?",
                          style: CustomTextStyles.bodySmallIndigo400,
                        ),
                      ),
                      SizedBox(height: 53.v),
                      CustomElevatedButton(
                        text: "Iniciar Sesión",
                        buttonTextStyle:
                            CustomTextStyles.titleMediumHindSiliguriGray50,
                        onPressed: () {
                          _onTapIniciarSesin(context);
                        },
                      ),
                      SizedBox(height: 53.v),
                      _buildLineFour(context),
                      SizedBox(height: 28.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            height: 42.adaptSize,
                            width: 42.adaptSize,
                            padding: EdgeInsets.all(9.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGoogle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: CustomIconButton(
                              height: 42.adaptSize,
                              width: 42.adaptSize,
                              padding: EdgeInsets.all(6.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGroup730,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.v),
                      GestureDetector(
                        onTap: () {
                          _onTapTxtNotienesunacuenta(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "¿No tienes una cuenta? ",
                                style: CustomTextStyles
                                    .bodyMediumHindSiliguriff2c406e,
                              ),
                              TextSpan(
                                text: "Únete",
                                style: theme.textTheme.titleSmall,
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 374.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft2,
        margin: EdgeInsets.fromLTRB(37.h, 21.v, 330.h, 21.v),
      ),
    );
  }

  Widget _buildLineFour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10.v,
            bottom: 8.v,
          ),
          child: SizedBox(
            width: 112.h,
            child: Divider(),
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Padding(
            padding: EdgeInsets.only(left: 22.h),
            child: Text(
              "o con",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10.v,
            bottom: 8.v,
          ),
          child: SizedBox(
            width: 141.h,
            child: Divider(
              indent: 29.h,
            ),
          ),
        )
      ],
    );
  }

  void _onTapIniciarSesin(BuildContext context) async {
    String UserId = checkmarkController.text;
    String Password = hiddenATMNoController.text;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.43.155:3001/auth'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userid': UserId,
          'pass': Password,
        }),
      );

      if (response.statusCode == 200) {
        // Inicio de sesión exitoso
        Navigator.pushNamed(context, AppRoutes.traductorScreen);
      } else {
        // Credenciales incorrectas
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Lo siento, las credenciales de inicio de sesión son incorrectas.'),
        ));
      }
    } catch (e) {
      // Error de conexión
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
    }
  }

  void _onTapTxtNotienesunacuenta(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}
