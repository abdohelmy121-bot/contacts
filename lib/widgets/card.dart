import 'package:contact/core/app_colors.dart';
import 'package:contact/core/contactdetails.dart';
import 'package:flutter/material.dart';
class card extends StatelessWidget {
  final Contactdetails contact;
  final VoidCallback onDelete;

  const card({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  static const Color gold = Color(0xFFFFF1D4);
  static const Color darkBlue = Color(0xFF29384D);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gold,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                
                    Container(
                        color: Colors.grey.shade400,
                        child: const Icon(Icons.person, size: 60),
                      ),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: appcolors.Gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: const TextStyle(
                        color: appcolors.DarkBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _InfoRow(icon: Icons.email, text: contact.email),
                const SizedBox(height: 4),
                _InfoRow(icon: Icons.phone, text: contact.phone),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 28,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEE403D),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 14, color: appcolors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: appcolors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: appcolors.DarkBlue),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 8, color: appcolors.DarkBlue),
          ),
        ),
      ],
    );
  }
}