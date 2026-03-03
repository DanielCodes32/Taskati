class Taskmodel {
  String? id;
  String? title;
  String? description;
  String? date;
  String? starttime;
  String? endtime;
  bool? iscompleted;

  Taskmodel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.starttime,
    this.endtime,
    this.iscompleted,
  });
 Taskmodel copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? starttime,
    String? endtime,
    bool? iscompleted,
  }) {
    return Taskmodel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      starttime: starttime ?? this.starttime,
      endtime: endtime ?? this.endtime,
      iscompleted: iscompleted ?? this.iscompleted,
    );
  }
}
