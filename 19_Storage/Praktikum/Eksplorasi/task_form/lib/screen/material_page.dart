import 'package:flutter/material.dart';
import 'package:prioritas1/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import '../db_helper/database_helper.dart';
import '../model/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formKey = GlobalKey<FormState>();
  late DatabaseHelper dbHelper; 
  late TextEditingController nameController;
  late TextEditingController numberController;
  List<Contact> contactList = [];

  late SharedPreferences loginData; // Tambah deklarasi variabel loginData

  String username = "";

  @override
  void initState() {
    super.initState();
    initial();
    dbHelper = DatabaseHelper();
    nameController = TextEditingController();
    numberController = TextEditingController();
    dbHelper.initializeDB().then((value) {
      refreshContacts();
    });
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("username")!;
    });
  }

  void refreshContacts() {
    dbHelper.getContacts().then((value) {
      setState(() {
        contactList = value;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 33, 243),
        title: Row(
          children: [
            const Text("Contact"),
            const Spacer(
              flex: 6,
            ),
            Text("Hello, $username"),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              loginData.setBool("login", true);
              loginData.remove("username");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              children: [
                // Widget lainnya...
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 173, 33, 243)),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data berhasil disimpan"),
                        ),
                      );
                      dbHelper.insertContact(Contact(
                        name: nameController.text, // Menggunakan value dari controller
                        number: numberController.text, // Menggunakan value dari controller
                      )).then((value) {
                        refreshContacts();
                        nameController.clear(); // Mengosongkan controller setelah penyimpanan
                        numberController.clear(); // Mengosongkan controller setelah penyimpanan
                      });
                    }
                  },
                  child: const Text("Submit"),
                ),
                            const SizedBox(width: 20.0),
                          ],
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
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color.fromARGB(
                                          255, 173, 33, 243),
                                      radius: 30,
                                      child: Text(
                                        avatarText,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style:
                                              const TextStyle(fontSize: 15.0),
                                        ),
                                        Text(
                                          dataList[position].number.toString(),
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      
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


