import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String month;
  final String day;
  final String image;
  final bool isFinalEvent;
  const EventWidget({
    super.key,
    required this.month,
    required this.day,
    required this.image,
    required this.isFinalEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        month,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        day,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isFinalEvent)
                  Container(
                    height: 180,
                    width: 1,
                    color: Colors.grey,
                  ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
