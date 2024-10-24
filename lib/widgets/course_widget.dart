import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final String month;
  final String day;
  final int courseType;
  final String image;
  final String startDate;
  final String endDate;
  final String courseName;

  const CourseWidget({
    super.key,
    required this.month,
    required this.day,
    required this.courseType,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 260,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff868599),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        month,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        day,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: courseType == 1
                        ? const Color(0xffE0E1CA)
                        : const Color(0xffE9CDD4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      courseType == 1
                          ? Icon(
                              Icons.book_outlined,
                              color: Colors.green.shade900,
                            )
                          : const Icon(
                              Icons.brush,
                              color: Color(0xff711D58),
                            ),
                      const SizedBox(
                        width: 2,
                      ),
                      courseType == 1
                          ? const Text(
                              'Workshops',
                              style: TextStyle(
                                color: Color(0xff711D58),
                              ),
                            )
                          : const Text(
                              'Arts & Culture',
                              style: TextStyle(
                                color: Color(0xff711D58),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          courseName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Color.fromARGB(255, 120, 83, 155),
              size: 16,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '$startDate · $endDate',
              style: const TextStyle(
                color: Color.fromARGB(255, 120, 83, 155),
              ),
            ),
          ],
        )
      ],
    );
  }
}
