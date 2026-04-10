import 'package:flutter/material.dart';
import 'appTheme.dart';

class Receiverinfo extends StatefulWidget {
  String name = '';
  String address = '';
  String bGroup = '';

  Receiverinfo({
    super.key,
    required this.name,
    required this.address,
    required this.bGroup,
  });

  @override
  State<StatefulWidget> createState() => _ReceiverInfoState();
}

class _ReceiverInfoState extends State<Receiverinfo> {
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

              //TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //Pic
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

                  // Blood group and distance
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
                      Text(
                        '2.5 km away',
                        style: AppTheme.hintStyle,
                      ),
                    ],
                  ),
                ],
              ),

              //Accept Request button
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: Text(
                              'Accept Request',
                              style: AppTheme.titleStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to accept this blood request?',
                              style: AppTheme.labelStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Cancel',
                                  style: AppTheme.hintStyle,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: AppTheme.primaryGradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Accept',
                                    style: AppTheme.buttonStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Accept Request',
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