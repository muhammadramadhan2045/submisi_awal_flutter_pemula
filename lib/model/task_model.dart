class Task {
  final String id;
  final String title;
  final String description;
  final String category;
  final String priority;
  final DateTime date;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.date,
    this.isCompleted = false,
  });
}

var taskList = [
  Task(
    id: '1',
    title: 'Watcing footbal',
    description:
        'Watching footbal match between Manchester United vs Liverpool',
    category: 'Sport',
    date: DateTime.now(),
    priority: 'Low',
    isCompleted: false,
  ),
  Task(
    id: '2',
    title: 'Membuat Aplikasi Flutter',
    description:
        'Membuat aplikasi Flutter dengan menggunakan bahasa pemrograman Dart',
    category: 'Work',
    date: DateTime(2023, 11, 18, 14, 30),
    priority: 'High',
    isCompleted: false,
  ),
  Task(
    id: '3',
    title: 'Membuat Aplikasi Kotlin',
    description:
        'Malin Kundang adalah cerita rakyat yang berasal dari provinsi Sumatera Barat, Indonesia. Legenda Malin Kundang berkisah tentang seorang anak yang durhaka pada ibunya dan karena itu dikutuk menjadi batu.Cerita rakyat yang mirip juga dapat ditemukan di negara-negara lain di Asia Tenggara. Di Malaysia cerita serupa berkisah tentang Si TenggangLegenda Malin Kundang berkisah tentang seorang anak yang durhaka pada ibunya dan karena itu dikutuk menjadi batu.Cerita rakyat yang mirip juga dapat ditemukan di negara-negara lain di Asia Tenggara. Di Malaysia cerita serupa berkisah tentang Si TenggangLegenda Malin Kundang berkisah tentang seorang anak yang durhaka pada ibunya dan karena itu dikutuk menjadi batu.Cerita rakyat yang mirip juga dapat ditemukan di negara-negara lain di Asia Tenggara. Di Malaysia cerita serupa berkisah tentang Si TenggangLegenda Malin Kundang berkisah tentang seorang anak yang durhaka pada ibunya dan karena itu dikutuk menjadi batu.Cerita rakyat yang mirip juga dapat ditemukan di negara-negara lain di Asia Tenggara. Di Malaysia cerita serupa berkisah tentang Si Tenggang',
    category: 'Work',
    date: DateTime.now(),
    priority: 'Medium',
    isCompleted: false,
  ),
  Task(
    id: '4',
    title: 'Latihan Taekwondo',
    description: 'Latihannya di Gor Cendrawasih jam 19.00 - 21.00',
    category: 'Personal',
    date: DateTime(2023, 11, 18, 14, 30),
    priority: 'High',
    isCompleted: false,
  ),
];

List<Task> getSortedTaskList() {
  List<Task> sortedTaskList = List.from(taskList);

  Map<String, int> priorityValues = {
    'High': 2,
    'Medium': 1,
    'Low': 0,
  };

  sortedTaskList.sort(
      (a, b) => priorityValues[b.priority]! - priorityValues[a.priority]!);

  return sortedTaskList;
}
