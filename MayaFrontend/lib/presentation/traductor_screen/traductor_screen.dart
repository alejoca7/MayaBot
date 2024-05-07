import 'package:flutter/material.dart';
import 'package:mayatraductor/widgets/app_bar/custom_app_bar.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_leading_image.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_title.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_subtitle.dart';
import 'package:mayatraductor/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mayatraductor/widgets/custom_elevated_button.dart';
import 'package:mayatraductor/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TraductorScreen extends StatelessWidget {
  final TextEditingController textEditingControllerEsp =
      TextEditingController();
  final TextEditingController textEditingControllerQeqchi =
      TextEditingController();
  final Widget bocina = CustomImageView(
    imagePath: ImageConstant.imgFluentSpeaker124Regular,
    height: 30.adaptSize,
    width: 30.adaptSize,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 27.h,
              vertical: 42.v,
            ),
            child: Column(
              children: [
                _buildFour(context),
                SizedBox(height: 43.v),
                Padding(
                  padding: EdgeInsets.only(right: 1),
                  child: _buildTwo(
                    context,
                    qEqchi: "Español",
                    textEditingController: textEditingControllerEsp,
                  ),
                ),
                SizedBox(height: 69),
                Padding(
                  padding: EdgeInsets.only(right: 1),
                  child: _buildTwo(
                    context,
                    qEqchi: "Q’eqchi’",
                    textEditingController: textEditingControllerQeqchi,
                    showSpeaker: true, // Mostrar la bocina
                    disableInput: true, // Deshabilitar la entrada de datos
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildTraducir(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 88.v,
      leadingWidth: 53.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgUser,
        margin: EdgeInsets.only(
          left: 6.h,
          top: 21.v,
          bottom: 19.v,
        ),
      ),
      title: Container(
        height: 42.34.v,
        width: 103.h,
        margin: EdgeInsets.only(left: 10.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AppbarTitle(
              text: "MayaBot",
              margin: EdgeInsets.only(bottom: 12.v),
            ),
            AppbarSubtitle(
              text: "Online",
              margin: EdgeInsets.only(
                left: 10.h,
                top: 27.v,
                right: 57.h,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 8.adaptSize,
                width: 8.adaptSize,
                margin: EdgeInsets.only(
                  top: 32.v,
                  right: 95.h,
                  bottom: 2.v,
                ),
                decoration: BoxDecoration(
                  color: appTheme.greenA200,
                  borderRadius: BorderRadius.circular(
                    4.h,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgClose,
          margin: EdgeInsets.fromLTRB(17.h, 33.v, 17.h, 31.v),
        )
      ],
      styleType: Style.bgShadow,
    );
  }

  Widget _buildFour(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFour(context);
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.all(6.h),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder23,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgLogo3,
              height: 35.v,
              margin: EdgeInsets.only(left: 3.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 9.v,
                bottom: 6.v,
              ),
              child: Text(
                "Q’eqchi’",
                style: theme.textTheme.titleMedium,
              ),
            ),
            Spacer(
              flex: 48,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgIcRoundSwapHoriz,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(
                top: 5.v,
                bottom: 6.v,
              ),
            ),
            Spacer(
              flex: 51,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.v,
                bottom: 7.v,
              ),
              child: Text(
                "Español",
                style: theme.textTheme.titleMedium,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgLogo3,
              height: 35.v,
              margin: EdgeInsets.only(left: 1.h),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTwo(
    BuildContext context, {
    required String qEqchi,
    required TextEditingController textEditingController,
    bool disableInput = false,
    bool showSpeaker = false, // Mostrar la bocina
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(9.h, 9.v, 9.h, 8.v),
      decoration: AppDecoration.outlinePrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLogo3,
                  height: 35.v,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 9.v,
                    bottom: 6.v,
                  ),
                  child: Text(
                    qEqchi,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: appTheme.indigo90001,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgCloseGray900,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    top: 3.v,
                    bottom: 8.v,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Stack(
            children: [
              TextFormField(
                controller: textEditingController,
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 122, 5, 255), // Cambia el color del texto a negro
                  fontSize:
                      16, // Ajusta el tamaño del texto según tus preferencias
                ),
                autocorrect: false,
                enableSuggestions: false, // Evita autocompletar
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: appTheme.gray500,
                  ),
                  border: InputBorder.none,
                ),
                enabled:
                    !disableInput, // habilita o deshabilita la entrada de datos
              ),
              if (showSpeaker) // Mostrar la bocina solo si showSpeaker es true
                Positioned(
                  right: 12.h,
                  top: 12.v,
                  child: bocina,
                ),
            ],
          ),
          SizedBox(height: 59.v),
        ],
      ),
    );
  }

  void _onTapTraducir(BuildContext context) async {
    String spanishWord = textEditingControllerEsp.text;

    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.73:3001/translations/spanish/$spanishWord'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final palabraTraducida = data['maya_word'];

        // Verificar si la palabra traducida está vacía
        if (palabraTraducida.isNotEmpty) {
          // La palabra existe, establece la traducción
          textEditingControllerQeqchi.text = palabraTraducida;
        } else {
          // La palabra no existe, muestra un mensaje en pantalla
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('¡La palabra no existe!'),
          ));
        }
      } else {
        // Manejar otros códigos de estado si es necesario
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al traducir la palabra'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
    }
  }

  Widget _buildTraducir(BuildContext context) {
    return CustomElevatedButton(
      text: "Traducir",
      margin: EdgeInsets.only(
        left: 38.h,
        right: 33.h,
        bottom: 20.v,
      ),
      onPressed: () {
        _onTapTraducir(context);
      },
    );
  }

  onTapFour(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.traductorTwoScreen);
  }
}
