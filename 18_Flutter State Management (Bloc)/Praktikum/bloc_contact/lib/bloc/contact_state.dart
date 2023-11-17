part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;

  const ContactsLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}
