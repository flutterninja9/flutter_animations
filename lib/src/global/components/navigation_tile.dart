import 'package:flutter/material.dart';

class NavTile extends StatelessWidget {
  const NavTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.where_to_vote),
      trailing: const Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
