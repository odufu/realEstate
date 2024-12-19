import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.brightness_high,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.grid_view,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
