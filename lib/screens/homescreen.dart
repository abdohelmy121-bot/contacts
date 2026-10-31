import 'package:contact/core/app_colors.dart';
import 'package:contact/core/contactdetails.dart';
import 'package:contact/widgets/AddContactSheet.dart';
import 'package:contact/widgets/card.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<homescreen> {
  final List<Contactdetails> contacts = [];

  Future<void> _openAddSheet() async {
    final Contactdetails? newContact = await showModalBottomSheet<Contactdetails>(
      context: context,
      isScrollControlled: true, 
      backgroundColor: appcolors.DarkBlue,
      builder: (context) => const AddContactSheet(),
    );

    if (newContact != null) {
      setState(() => contacts.add(newContact));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: appcolors.DarkBlue,
  elevation: 0,
  title: Image.asset('assets/images/Group 6.png', height: 32),
  centerTitle: false, 
),
      backgroundColor: appcolors.DarkBlue,
      body: contacts.isEmpty
          ?  Center(child: Column(
                children: [
                  Image.asset("assets/images/list-purple.png"),
                  Text(
                    "There is No Contacts Added Here",
                    style: TextStyle(
                      color: appcolors.Gold,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),)
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final c = contacts[index];
                return card(
                  contact: c,
                  onDelete: () => setState(() => contacts.removeAt(index)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appcolors.Gold,
        onPressed: _openAddSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}