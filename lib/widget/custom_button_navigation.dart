// lib/widgets/custom_navigation_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_santara/cubit/page_cubit.dart';
import '../shared/theme.dart'; // pastikan path-nya sesuai struktur Anda

class CustomButtonNavigationItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;

  const CustomButtonNavigationItem({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    
    final currentIndex = context.watch<PageCubit>().state;
    final bool isActive = (currentIndex == index);

    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive 
              ? KPrimaryColor.withOpacity(0.15) 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive 
                    ? KPrimaryColor.withOpacity(0.25) 
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24,
                color: isActive 
                    ? KPrimaryColor 
                    : KGreyColor,
              ),
            ),

            // Teks muncul hanya saat aktif
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
