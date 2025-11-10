import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/exam_detail_screen.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget{
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd.MM.yyyy");
    final timeFormat = DateFormat("HH:mm");

    return Card(
      color: exam.examIncoming ? Colors.green : Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(Icons.school, color: Colors.black),
        title: Text(exam.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text(dateFormat.format(exam.date), style: TextStyle(color: Colors.black)),
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text(timeFormat.format(exam.date), style: TextStyle(color: Colors.black)),
            ]),
            Row(children: [
              const Icon(Icons.meeting_room, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  exam.rooms.join(', '),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black)
                )
              )
            ]),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exam)
              )
          );
        },
      ),
    );
  }
}