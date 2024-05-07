import 'package:flutter/material.dart';
import 'package:mayatraductor/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('MayaBot'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            // Navegar a la pantalla de inicio de sesión
            Navigator.pushNamed(context, AppRoutes.iniciarSesiNScreen);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadow:
        return Container(
          height: 88.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onError,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.h),
            ),
            // No incluyas la sombra en esta configuración
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadow,
  bgTransparent,
  none,
}
