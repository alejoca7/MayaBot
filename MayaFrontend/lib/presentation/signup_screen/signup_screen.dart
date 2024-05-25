import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayatraductor/core/app_export.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_leading_image.dart';
import 'package:mayatraductor/widgets/custom_text_form_field.dart';
import 'package:mayatraductor/widgets/custom_elevated_button.dart';
import 'package:mayatraductor/widgets/custom_icon_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  TextEditingController megaphoneController = TextEditingController();
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
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 35.h,
                  vertical: 39.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Registrarse",
                              style: theme.textTheme.displaySmall,
                            ),
                            TextSpan(
                              text: "",
                              style: theme.textTheme.displaySmall,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 38.v),
                    _buildMegaphone(context),
                    SizedBox(height: 41.v),
                    _buildCheckmark(context),
                    SizedBox(height: 37.v),
                    _buildHiddenATMNo(context),
                    SizedBox(height: 54.v),
                    _buildRegistrarse(context),
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
                    SizedBox(height: 92.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtTienesalgunacuenta(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "¿Tienes alguna cuenta? ",
                              style: CustomTextStyles
                                  .bodyMediumHindSiliguriff2c406e,
                            ),
                            TextSpan(
                              text: "Inicia sesión",
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
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft2,
        margin: EdgeInsets.fromLTRB(35.h, 21.v, 332.h, 21.v),
      ),
    );
  }

  Widget _buildMegaphone(BuildContext context) {
    return CustomTextFormField(
      controller: megaphoneController,
      hintText: "Usuario",
      textStyle: TextStyle(
        color: Color.fromARGB(255, 122, 5, 255), // Color personalizado
      ),
      prefix: Container(
        margin: EdgeInsets.only(
          top: 1.v,
          right: 13.h,
          bottom: 16.v,
        ),
        child: CustomImageView(
          imagePath: ImageConstant.imgMegaphone,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 41.v,
      ),
      contentPadding: EdgeInsets.only(right: 30.h),
    );
  }

  Widget _buildCheckmark(BuildContext context) {
    return CustomTextFormField(
      controller: checkmarkController,
      hintText: "Correo Electrónico",
      textStyle: TextStyle(
        color: Color.fromARGB(255, 122, 5, 255), // Color personalizado
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
    );
  }

  Widget _buildHiddenATMNo(BuildContext context) {
    return CustomTextFormField(
      controller: hiddenATMNoController,
      hintText: "****************",
      textStyle: TextStyle(
        color: Color.fromARGB(255, 122, 5, 255), // Color personalizado
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
      obscureText: true,
      contentPadding: EdgeInsets.only(right: 30.h),
    );
  }

  Widget _buildRegistrarse(BuildContext context) {
    return CustomElevatedButton(
      text: "Registrarse",
      onPressed: () {
        registerUser(context);
      },
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

  void registerUser(BuildContext context) async {
    String UserId = megaphoneController.text;
    String Email = checkmarkController.text;
    String Password = hiddenATMNoController.text;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.43.155:3001/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userid': UserId,
          'email': Email,
          'pass': Password,
        }),
      );

      if (response.statusCode == 200) {
        _showRegistrationSuccessDialog(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error en el registro. Por favor, inténtalo de nuevo.'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
    }
  }

  void onTapTxtTienesalgunacuenta(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iniciarSesiNScreen);
  }

  void _showRegistrationSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '¡Registro Exitoso!',
            style: TextStyle(
              color: Color.fromARGB(255, 122, 5, 255), // Morado
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '¡Felicitaciones! Te has registrado exitosamente.',
                  style: TextStyle(
                    color: Colors.black, // Negro
                    fontWeight: FontWeight.bold, // Texto en negrita
                  ),
                ),
                Text(
                  'Ahora puedes iniciar sesión con tu nueva cuenta.',
                  style: TextStyle(
                    color: Colors.black, // Negro
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.black, // Negro
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.pushNamed(
                  context,
                  AppRoutes.iniciarSesiNScreen,
                ); // Navega a la pantalla de inicio de sesión
              },
            ),
          ],
        );
      },
    );
  }
}
