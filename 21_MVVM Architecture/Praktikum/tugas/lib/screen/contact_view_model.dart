import 'package:flutter/material.dart';
import 'package:tugas/model/contact_model.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  final nameParts = value.split(' ');
  if (nameParts.length < 2) {
    return 'The name must consist of at least 2 words';
  }
  for (final namePart in nameParts) {
    if (namePart.isNotEmpty && namePart[0] != namePart[0].toUpperCase()) {
      return 'Every word must start with a capital letter';
    }
  }
  final RegExp regex = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');

  if (!regex.hasMatch(value)) {
    return 'The name must not contain numbers or special characters';
  }

  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your Nomor";
  }
  final RegExp regex = RegExp(r'^[0-9]*$');

  if (!regex.hasMatch(value)) {
    return 'Telephone numbers can only consist of numbers';
  }

  if (value.length < 8 || value.length > 15) {
    return 'The length of the telephone number must be a minimum of 8 digits and a maximum of 15 digits';
  }

  if (!value.startsWith('0')) {
    return 'Telephone numbers must start with the digit 0';
  }

  return null;
}
