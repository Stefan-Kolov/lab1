import 'package:flutter/material.dart';
import '../widgets/exam_card.dart';

import '../models/exam.dart';

class ExamListScreen extends StatelessWidget{
  final String index = "223226";

  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(name: "Мобилни информациски системи", date: DateTime(2025, 12, 15, 16, 0), rooms: ['215', '138']),
    Exam(name: "Менаџмент информациски системи", date: DateTime(2025, 10, 23, 12, 0), rooms: ['200аб', 'лаб.13']),
    Exam(name: "Структурно програмирање", date: DateTime(2025, 11, 15, 8, 0), rooms: ['лаб.2','лаб.3','лаб.13','лаб.138','лаб.200аб']),
    Exam(name: "Напредно програмирање", date: DateTime(2025, 10, 15, 16, 30), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб']),
    Exam(name: "Вовед во компјутерски науки", date: DateTime(2025, 9, 17, 9, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб', 'лаб.117']),
    Exam(name: "Шаблони за дизајн на кориснички интерфејси", date: DateTime(2025, 11, 18, 8, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц']),
    Exam(name: "Администрација на системи", date: DateTime(2025, 10, 18, 12, 0), rooms: ['лаб.117']),
    Exam(name: "Бази на податоци", date: DateTime(2025, 11, 19, 8, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц','лаб.117']),
    Exam(name: "Имплементација на софтверски системи со слободен и отворен код", date: DateTime(2025, 11, 19, 16, 0), rooms: ['лаб.13','лаб.138','лаб.200аб']),
    Exam(name: "Дискретна математика", date: DateTime(2025, 11, 20, 8, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц']),
    Exam(name: "Напреден веб дизајн ", date: DateTime(2025, 10, 20, 14, 30), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц']),
    Exam(name: "Алгоритми и податочни структури", date: DateTime(2025, 11, 21, 8, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц']),
    Exam(name: "Веб програмирање", date: DateTime(2025, 11, 21, 17, 0), rooms: ['лаб.2','лаб.3','лаб.12','лаб.13','лаб.138','лаб.200аб','лаб.200ц']),
    Exam(name: "Сајбер безбедност/ Мрежна безбедност", date: DateTime(2025, 11, 21, 14, 30), rooms: ['лаб.2','лаб.3']),
    Exam(name: "Дискретни структури 1", date: DateTime(2025, 11, 21, 10, 0), rooms: ['Б2.2', 'Б3.2', 'АМФ ФИНКИ Г'])
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $index', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) => ExamCard(exam: exams[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.white,
              label: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            )
          ]
        )
      )
    );
  }

}