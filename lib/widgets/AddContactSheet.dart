import 'package:contact/core/app_colors.dart';
import 'package:contact/core/contactdetails.dart';
import 'package:flutter/material.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    super.dispose();
  }

  void _submit() {
    if (namecontroller.text.trim().isEmpty) return;

    final contact = Contactdetails(
      name: namecontroller.text.trim(),
      email: emailcontroller.text.trim(),
      phone: phonecontroller.text.trim(),
    );

    Navigator.pop(context, contact); 
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setModelState) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: appcolors.Gold),
                        ),
                        child: Image.asset(
                          "assets/images/image-not-preview.png",
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        height: 146,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (namecontroller.text).isEmpty ? "User Name" : (namecontroller.text),
                              style: TextStyle(
                                color: appcolors.Gold,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(color: appcolors.Gold),
                            Text(
                              (emailcontroller.text).isEmpty ? "example@email.com" : (emailcontroller.text),
                              style: TextStyle(
                                color: appcolors.Gold,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(color: appcolors.Gold),
                            Text(
                              (phonecontroller.text).isEmpty ? "+200000000000" : (phonecontroller.text),
                              style: TextStyle(
                                color: appcolors.Gold,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter User Name',

                      hintStyle: TextStyle(
                        color: appcolors.LightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                    ),
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter User Email ',

                      hintStyle: TextStyle(
                        color: appcolors.LightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                    ),
                  ),
                  TextField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter User Phone',
                      hintStyle: TextStyle(
                        color: appcolors.LightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: appcolors.Gold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appcolors.Gold,
                      fixedSize: Size(385, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (namecontroller.text.trim().isEmpty) return;

                      final contact = Contactdetails(
                        name: namecontroller.text.trim(),
                        email: emailcontroller.text.trim(),
                        phone: phonecontroller.text.trim(),
                      );

                      Navigator.pop(context, contact);
                    },
                    child: Text(
                      "Enter user",
                      style: TextStyle(
                        color: appcolors.DarkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
