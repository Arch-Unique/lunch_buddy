import 'dart:ui';

class Note {
  String title;
  String content;
  Color? color;
  DateTime? time;
  int? id;

  Note(
      {required this.title,
      required this.content,
      this.color,
      this.id,
      this.time});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'time': time!.toString(),
      'color': color!.value,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      time: DateTime.parse(map['time']),
      color: Color(map['color']),
      id: map['id'],
    );
  }
}
