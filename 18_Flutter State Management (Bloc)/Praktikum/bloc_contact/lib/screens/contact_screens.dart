import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:st_bloc_contact/bloc/contact_bloc.dart';
import 'package:st_bloc_contact/models/contact_model.dart';
import '../widget/color_picker.dart' as buildColorPicker;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameChangeController = TextEditingController();
  final _phoneChangeController = TextEditingController();
  // ignore: unused_field
  final DateTime _dueDate = DateTime.now();
  DateTime? _selectedDate;
  Color _currentColors = Colors.orange;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _nameChangeController.dispose();
    _phoneChangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(221, 152, 255, 1),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/gridview');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 33, 243),
              ),
              child: const Text(
                'Galeri',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 33, 243),
              ),
              child: const Text(
                'Contact',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  setState(() {
                    _selectedDate = selectedDate; // Simpan tanggal yang dipilih
                  });
                }
              },
              child: const Text('Masukkan Tanggal'),
            ),
          ),
          const SizedBox(height: 20.0),
          const buildColorPicker.ColorPicker(),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ContactBloc>(context).add(
                AddContactEvent(
                  Contact(
                      name: _nameController.text,
                      phoneNumber: _phoneController.text,
                      date: _selectedDate,
                      currentColor: _currentColors),
                ),
              );
              _nameController.clear();
              _phoneController.clear();
            },
            child: const Text('Add Contact'),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state is ContactsLoaded) {
                  return ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = state.contacts[index];
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact.phoneNumber),
                            if (contact.date != null) ...[
                              Text(
                                "Date: ${DateFormat('dd-MM-yyyy').format(contact.date!)}",
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ],
                            Row(
                              children: [
                                const Text("Color = "),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: contact.currentColor ?? Colors.orange,
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _nameChangeController.text =
                                    state.contacts[index].name;
                                _phoneChangeController.text =
                                    state.contacts[index].phoneNumber;
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: const Text('Edit Contact'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: _nameChangeController,
                                            decoration: const InputDecoration(
                                                labelText: 'Name'),
                                          ),
                                          TextField(
                                            controller: _phoneChangeController,
                                            decoration: const InputDecoration(
                                                labelText: 'Phone Number'),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            BlocProvider.of<ContactBloc>(
                                                    context)
                                                .add(
                                              UpdateContactEvent(
                                                Contact(
                                                    name: state
                                                        .contacts[index].name,
                                                    phoneNumber: state
                                                        .contacts[index]
                                                        .phoneNumber,
                                                    currentColor:
                                                        _currentColors),
                                                Contact(
                                                    name: _nameChangeController
                                                        .text,
                                                    phoneNumber:
                                                        _phoneChangeController
                                                            .text,
                                                    currentColor:
                                                        _currentColors),
                                              ),
                                            );
                                            _nameChangeController.clear();
                                            _phoneChangeController.clear();
                                            Navigator.of(dialogContext).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Contact Updated!')),
                                            );
                                            setState(() {});
                                          },
                                          child: const Text('Update'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                final contactName = state.contacts[index].name;

                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: Text(
                                          'Are you sure you want to delete $contactName?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            BlocProvider.of<ContactBloc>(
                                                    context)
                                                .add(
                                              DeleteContactEvent(
                                                  state.contacts[index].name),
                                            );
                                            Navigator.of(dialogContext).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Contact Deleted!')),
                                            );
                                            setState(() {});
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
