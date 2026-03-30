
import 'package:flutter/material.dart';
import 'appTheme.dart';

class info extends StatefulWidget {
  String name = '';
  String address = '';
  String bGroup = '';

  info({
    super.key,
    required this.name,
    required this.address,
    required this.bGroup,
  });

  @override
  State<StatefulWidget> createState() => _InfoState();
}

class _InfoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        shadowColor: Colors.white70,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // ── TOP ROW: avatar + name/address + blood group ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Avatar
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('Avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Name and address
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppTheme.inputStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.address,
                          style: AppTheme.hintStyle,
                        ),
                      ],
                    ),
                  ),

                  // Blood group and call button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.bGroup,
                        style: AppTheme.inputStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppTheme.primaryRed,
                        ),
                      ),
                      IconButton(
                        color: AppTheme.primaryRed,
                        onPressed: () {},
                        icon: const Icon(Icons.call),
                      ),
                    ],
                  ),

                ],
              ),

              // ── BOTTOM ROW: View Details button ───────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'View Details',
                        style: AppTheme.buttonStyle,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}