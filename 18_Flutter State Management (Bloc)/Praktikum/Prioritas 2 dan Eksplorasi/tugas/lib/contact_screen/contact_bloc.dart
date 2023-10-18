// ignore_for_file: override_on_non_overriding_member

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Event untuk mengirim perubahan ke Bloc
abstract class ContactEvent {}

class ContactSubmitEvent extends ContactEvent {
  final String name;
  final String number;
  final DateTime date;
  final Color color;
  final String? file;

  ContactSubmitEvent({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    this.file,
  });
}

// State untuk menangani perubahan dalam UI
abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactSuccessState extends ContactState {}

class ContactFailureState extends ContactState {
  final String error;

  ContactFailureState(this.error);
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitialState());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is ContactSubmitEvent) {
      // Di sini Anda dapat memproses data kontak dan melakukan tindakan yang sesuai, seperti menyimpan ke database atau sumber data lainnya.
      // Setelah pemrosesan selesai, Anda bisa mengirim state ContactSuccessState atau ContactFailureState tergantung pada hasilnya.
    }
  }
}
