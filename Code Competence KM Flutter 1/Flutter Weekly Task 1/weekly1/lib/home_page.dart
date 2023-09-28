import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome To Weekly Aplication',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Image.asset(
          'assets/icons.png',
          height: 200,
        ),
        Text(
          'Selamat Datang di Halaman project Code KM Flutter 1',
          style: GoogleFonts.playfairDisplay(fontSize: 15),
        ),
      ],
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String? Function(String?)? validateEmail = (value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Masukkan email yang valid';
    }
    return null; // Validasi berhasil
  };

  void submit() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Data yang Anda masukkan:'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('First Name: ${firstNameController.text}'),
                Text('Last Name: ${lastNameController.text}'),
                Text('Email: ${emailController.text}'),
                Text('Message: ${messageController.text}'),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Tutup'),
                onPressed: () {
                  // Clear the text in the TextFormFields
                  firstNameController.clear();
                  lastNameController.clear();
                  emailController.clear();
                  messageController.clear();

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('First Name',
                              style: TextStyle(fontSize: 16)),
                          TextFormField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color.fromARGB(81, 210, 216, 48),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Last Name',
                              style: TextStyle(fontSize: 16)),
                          TextFormField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color.fromARGB(81, 210, 216, 48),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email', style: TextStyle(fontSize: 16)),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(81, 210, 216, 48),
                      ),
                      validator: validateEmail,
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('What can we help you with?',
                        style: TextStyle(fontSize: 16)),
                    TextFormField(
                      maxLines: 5,
                      controller: messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(81, 210, 216, 48),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
