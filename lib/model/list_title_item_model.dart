import 'package:flutter/material.dart';

class ListTitleItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ListTitleItemModel({required this.title, required this.icon, required this.onTap});
}
