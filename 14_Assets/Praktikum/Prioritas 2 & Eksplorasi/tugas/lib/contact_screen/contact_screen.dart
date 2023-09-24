import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => ContactState();
}

class Data {
  String? name;
  String? number;
  DateTime? date;
  Color? currentColors;
  String? file;

  Data({this.name, this.number, this.date, this.currentColors, this.file});
  Color? get currentColor => currentColors;
  set currentColor(Color? color) {
    currentColors = color;
  }
}

class ContactState extends State<Contact> {
  String? updatedFileName;
  String? selectedFileName;
  //for color
  Color currentColors = Colors.orange;
  //for date
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  //for input:
  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? number;
  List<Data> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 33, 243),
        title: const Text("Contact"),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(221, 152, 255, 1),
        child: ListView(
          children: [
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
                        buildDatePicker(
                          context,
                          _dueDate,
                          (newDate) {
                            setState(() {
                              _dueDate = newDate;
                            });
                          },
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
                                        Color.fromARGB(255, 173, 33, 243)),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data berhasil disimpan"),
                                    ),
                                  );
                                  dataList.add(Data(
                                    name: name,
                                    number: number,
                                    date: _dueDate,
                                    currentColors: currentColors,
                                    file: selectedFileName,
                                  ));

                                  setState(() {});

                                  formKey.currentState!.reset();

                                  setState(() {
                                    _dueDate = DateTime.now();
                                    currentColors = Colors.orange;
                                    selectedFileName = null;
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
                          itemCount: dataList.length,
                          itemBuilder: (context, position) {
                            String name = dataList[position].name ?? "";
                            String avatarText =
                                name.substring(0, 1).toUpperCase();
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
                                    dataList[position].number.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                  ),
                                  if (dataList[position].date != null) ...[
                                    Text(
                                      "Date: ${DateFormat('dd-MM-yyyy').format(dataList[position].date!)}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                  Row(
                                    children: [
                                      const Text("Color = "),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color:
                                            dataList[position].currentColor ??
                                                Colors.orange,
                                      ),
                                    ],
                                  ),
                                  if (dataList[position].file != null) ...[
                                    Text(
                                      "File Name = ${dataList[position].file}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      // Hapus item dari dataList
                                      dataList.removeAt(position);
                                      setState(() {});
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      _editContact(context, dataList,
                                          dataList[position], position, () {
                                        setState(() {});
                                      });
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

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: currentColors,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColors),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                          pickerColor: currentColors,
                          onColorChanged: (color) {
                            setState(() {
                              currentColors = color;
                            });
                          }),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context, DateTime selectedDate,
      Function(DateTime) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(DateTime.now().year + 5),
                );

                if (newDate != null) {
                  onDateSelected(newDate);
                }
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }

  void _editColor(
      BuildContext context, Data contact, Function(Color) setColorCallback) {
    Color currentColor = contact.currentColors ?? Colors.orange;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Color"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlockPicker(
                  pickerColor: currentColor,
                  onColorChanged: (newColor) {
                    currentColor = newColor;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Simpan warna yang dipilih
                setColorCallback(currentColor);

                // Tutup dialog
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

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

  Widget buildFilePicker(String? initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFiles(initialValue);
            },
            child: const Text("Pick and Open Files"),
          ),
        ),
      ],
    );
  }

  void _pickFiles(String? initialValue) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFileName = file.name;
    });
    updatedFileName = selectedFileName;
    _openFiles(file);
  }

  void _openFiles(PlatformFile file) {
    // Simpan path file ke dalam dataList saat file dipilih
    dataList.add(Data(
      name: name,
      number: number,
      date: _dueDate,
      currentColors: currentColors,
      file: file.path, // Simpan path file di sini
    ));
    setState(() {});
  }

  void _editContact(BuildContext context, List<Data> dataList, Data contact,
      int position, VoidCallback setStateCallback) {
    String updatedName = contact.name ?? "";
    String updatedNumber = contact.number ?? "";
    DateTime? updatedDate = contact.date;
    String? updatedFileName = contact.file;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime selectedDate = updatedDate ?? DateTime.now();

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
                    buildDatePicker(
                      context,
                      selectedDate,
                      (newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text('Color :'),
                    ElevatedButton(
                      onPressed: () {
                        _editColor(context, dataList[position], (newColor) {
                          setState(() {
                            dataList[position].currentColors = newColor;
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
                        dataList[position].name = updatedName;
                        dataList[position].number = updatedNumber;
                        dataList[position].date = selectedDate;
                        dataList[position].file =
                            updatedFileName; // Perbarui file di sini

                        // Tutup dialog
                        Navigator.of(context).pop();

                        setStateCallback();
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
