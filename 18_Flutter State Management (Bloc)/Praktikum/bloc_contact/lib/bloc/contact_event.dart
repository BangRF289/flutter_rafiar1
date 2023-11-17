part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  const AddContactEvent(this.contact);

  @override
  List<Object> get props => [contact];
}

class UpdateContactEvent extends ContactEvent {
  final Contact oldContact;
  final Contact updatedContact;

  const UpdateContactEvent(this.oldContact, this.updatedContact);

  @override
  List<Object> get props => [oldContact, updatedContact];
}

class DeleteContactEvent extends ContactEvent {
  final String name;

  const DeleteContactEvent(this.name);

  @override
  List<Object> get props => [name];
}
