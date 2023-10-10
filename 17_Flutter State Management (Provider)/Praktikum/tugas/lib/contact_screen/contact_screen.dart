import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas/contact_screen/contact_provider.dart';

class Data {
  String? name;
  String? number;
  DateTime? date;
  Color? currentColors;
  String? file;

  Data({this.name, this.number, this.date, this.currentColors, this.file});
}

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => ContactState();
}

class ContactState extends State<Contact> {
  String? updatedFileName;
  String? selectedFileName;
  String? ubahFileName = "";

  Color currentColors = Colors.orange;

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? number;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 33, 243),
        title: const Text("Contact"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.phone_android, size: 48.0),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Create New Contact",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    "Please enter name and telephone number to create a new contact.",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(81, 173, 33, 243),
                          ),
                          validator: (value) {
                            name = value;
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            final nameParts = value.split(' ');
                            if (nameParts.length < 2) {
                              return 'The name must consist of at least 2 words';
                            }
                            for (final namePart in nameParts) {
                              if (namePart.isNotEmpty &&
                                  namePart[0] != namePart[0].toUpperCase()) {
                                return 'Every word must start with a capital letter';
                              }
                            }
                            final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');

                            if (!regex.hasMatch(value)) {
                              return 'The name must not contain numbers or special characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Number",
                            hintText: "Enter your Number",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(81, 173, 33, 243),
                          ),
                          validator: (value) {
                            number = value;
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
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: _dueDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null &&
                                selectedDate != _dueDate) {
                              setState(() {
                                _dueDate = selectedDate;
                              });
                            }
                          },
                          child: const Text("Edit Date"),
                        ),
                        const SizedBox(height: 20.0),
                        buildColorPicker(context),
                        const SizedBox(height: 20),
                        buildFilePicker(selectedFileName),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 173, 33, 243),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data berhasil disimpan"),
                                    ),
                                  );

                                  final newContact = Data(
                                    name: name,
                                    number: number,
                                    date: _dueDate,
                                    currentColors: currentColors,
                                    file: ubahFileName,
                                  );
                                  print(newContact);
                                  print(ubahFileName);
                                  contactProvider.addContact(newContact);

                                  formKey.currentState!.reset();

                                  setState(() {
                                    _dueDate = DateTime.now();
                                    currentColors = Colors.orange;
                                    // selectedFileName = null;
                                  });
                                }
                              },
                              child: const Text("Submit"),
                            ),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          "List View",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: contactProvider.dataList.length,
                          itemBuilder: (context, position) {
                            final contact = contactProvider.dataList[position];
                            String name = contact.name ?? "";
                            String avatarText =
                                name.isNotEmpty ? name[0].toUpperCase() : "";
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 173, 33, 243),
                                radius: 30,
                                child: Text(
                                  avatarText,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                name,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contact.number ?? "",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
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
                                        color: contact.currentColors ??
                                            Colors.orange,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "File Name = ${contact.file}",
                                    style: const TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      contactProvider.deleteContact(position);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      _editContact(context, contactProvider,
                                          contact, position);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFilePicker(String? selectedFileName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result =
                await FilePicker.platform.pickFiles(type: FileType.any);
            if (result != null) {
              selectedFileName = result.files.single.name;
              print(selectedFileName);
              setState(() {
                ubahFileName = selectedFileName;
              });
            }
          },
          child: const Text("Pick File"),
        ),
        if (selectedFileName != null)
          Text(
            "Selected File: $selectedFileName",
            style: const TextStyle(fontSize: 15.0),
          ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _editColor(context, Data(currentColors: currentColors), (newColor) {
          setState(() {
            currentColors = newColor;
          });
        });
      },
      child: const Text("Edit Color"),
    );
  }

  // Implementasi _editColor
  void _editColor(
      BuildContext context, Data contact, Function(Color) callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color selectedColor = contact.currentColors ?? Colors.orange;

        return AlertDialog(
          title: const Text("Edit Color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (newColor) {
                selectedColor = newColor;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                callback(selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Implementasi _editFile
  void _editFile(
      BuildContext context, Data contact, Function(String?) callback) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;
      callback(filePath);
    }
  }

  void _editContact(BuildContext context, ContactProvider contactProvider,
      Data contact, int position) {
    String updatedName = contact.name ?? "";
    String updatedNumber = contact.number ?? "";

    String? updatedFileName = contact.file;
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
      final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');

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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Edit Contact"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      initialValue: updatedName,
                      onChanged: (value) {
                        updatedName = value;
                      },
                      validator: validateName,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nomor Telepon'),
                      initialValue: updatedNumber,
                      onChanged: (value) {
                        updatedNumber = value;
                      },
                      validator: validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: _dueDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null && selectedDate != _dueDate) {
                          setState(() {
                            _dueDate = selectedDate;
                          });
                        }
                      },
                      child: const Text("Edit Date"),
                    ),
                    const SizedBox(height: 10),
                    const Text('Color :'),
                    ElevatedButton(
                      onPressed: () {
                        _editColor(context, contact, (newColor) {
                          setState(() {
                            contact.currentColors = newColor;
                          });
                        });
                      },
                      child: const Text("Edit Color"),
                    ),
                    const SizedBox(height: 10),
                    buildFilePicker(updatedFileName),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    final nameError = validateName(updatedName);
                    final numberError = validatePhoneNumber(updatedNumber);

                    if (nameError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(nameError),
                        ),
                      );
                    } else if (numberError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(numberError),
                        ),
                      );
                    } else {
                      if (validateName(updatedName) == null &&
                          validatePhoneNumber(updatedNumber) == null) {
                        // Perbarui objek Data dalam dataList
                        contactProvider.editContact(
                            position,
                            Data(
                              name: updatedName,
                              number: updatedNumber,
                              date: _dueDate,
                              currentColors: contact.currentColors,
                              file: ubahFileName,
                            ));

                        // Tutup dialog
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
