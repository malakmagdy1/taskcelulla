import 'package:flutter/material.dart';
import 'package:task/core/widget/constant/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;

  const CustomAppBar({required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 130,
      backgroundColor: mainColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 40),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1 ?? "",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              title2 ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(130); // Required for Scaffold
}
