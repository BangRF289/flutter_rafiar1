import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:st_bloc_contact/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final List<Contact> _contacts = [];

  ContactBloc() : super(ContactInitial()) {
    on<GetContactsEvent>((event, emit) {
      emit(ContactsLoaded(_contacts));
    });

    on<AddContactEvent>((event, emit) {
      _contacts.add(event.contact);
      emit(ContactsLoaded(_contacts));
    });

    on<UpdateContactEvent>((event, emit) {
      int index = _contacts
          .indexWhere((contact) => contact.name == event.oldContact.name);
      if (index != -1) {
        _contacts[index] = event.updatedContact;
        emit(ContactsLoaded(_contacts));
      }
    });

    on<DeleteContactEvent>((event, emit) {
      _contacts.removeWhere((contact) => contact.name == event.name);
      emit(ContactsLoaded(_contacts));
    });
  }
}
