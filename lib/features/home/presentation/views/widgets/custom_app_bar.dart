import 'package:flutter/material.dart';
import '../../../../../core/utiles/styles.dart';

PreferredSizeWidget? customAppBar(context) => AppBar(
  automaticallyImplyLeading: false,
  title: Text(
    'Salla', style: Styles.textStyle20.copyWith(color: Colors.white),
  ),
  actions: [
    IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: Colors.white, size: 30,)
    )
  ],
  backgroundColor: Colors.lightBlue,
);