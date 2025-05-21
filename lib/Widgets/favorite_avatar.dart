import 'package:flutter/material.dart';

class FavoriteAvatar extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final IconData? icon;
  final String? countryFlag;
  final VoidCallback? onTap;

  const FavoriteAvatar({
    Key? key,
    required this.label,
    this.imageUrl,
    this.icon,
    this.countryFlag,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Colors.blue.shade100,
                backgroundImage:
                    imageUrl != null ? NetworkImage(imageUrl!) : null,
                child:
                    icon != null && imageUrl == null
                        ? Icon(icon, size: 38, color: Colors.grey.shade600)
                        : imageUrl == null && label.isNotEmpty
                        ? Text(
                          label
                              .split(' ')
                              .map((word) => word[0])
                              .take(2)
                              .join()
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        )
                        : null,
              ),
              if (countryFlag != null)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      countryFlag!,
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
