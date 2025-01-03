import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final IconData leadingIcon;
  final VoidCallback? onLeadingPressed;

  const  CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.titleColor = const Color(0xFFC0C5E0),
    this.leadingIcon = Icons.arrow_back,
    this.onLeadingPressed,
  });

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
