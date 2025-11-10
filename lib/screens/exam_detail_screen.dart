import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget{
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.date.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours;

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.name, style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.blueAccent
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Предмет: ${exam.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text('Датум: ${DateFormat('dd.MM.yyyy').format(exam.date)}'),
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text('Време: ${DateFormat('HH:mm').format(exam.date)}'),
            ]),
            Row(children: [
              const Icon(Icons.meeting_room, size: 16),
              const SizedBox(width: 4),
              Text('Простории: '),
              Expanded(
                  child: Text(
                    exam.rooms.join(', '),
                    softWrap: true,
                  )
              )
            ]),
            const SizedBox(height: 20),
            if (exam.examIncoming)
              Row(children: [
                const Icon(Icons.check, size: 20, color: Colors.green),
                const SizedBox(width: 4),
                Text(
                  'До испитот има: $days дена, $hours часа',
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ])
            else
              Row(children: [
                const Icon(Icons.cancel, size: 20, color: Colors.red),
                const SizedBox(width: 4),
                Text(
                  'Испитот е поминат!',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ])
          ],
        )
      ),
    );
  }
}