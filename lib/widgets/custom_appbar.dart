import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final IconData leadingIcon;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.titleColor = Colors.white,
    this.leadingIcon = Icons.arrow_back,
    this.onLeadingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(leadingIcon, color: titleColor),
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
