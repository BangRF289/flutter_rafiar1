// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Contact extends Equatable {
  final String name;
  final String phoneNumber;
  DateTime? date;
  Color? currentColor;
  String? fileName;

  Contact({
    required this.name,
    required this.phoneNumber,
    this.date,
    required this.currentColor,
    this.fileName,
  });

  @override
  List<Object?> get props => [name, phoneNumber, date, currentColor, fileName];
}
