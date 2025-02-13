import 'package:flutter/material.dart';

class DashboardModel {
  final int index;
  final String title;
  final Widget? route;
  final IconData icon;
  final bool isExpansionTile; // To check if the item is an ExpansionTile
  final List<DashboardModel> children; // To hold the child items for expansion tiles

  DashboardModel({
    required this.index,
    required this.title,
    required this.icon,
    this.route,
    this.isExpansionTile = false, // Default to false for regular drawer items
    this.children = const [], // Default to an empty list
  });
}
