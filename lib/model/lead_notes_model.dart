class LeadNotesModel {
  final String time;
  final String content;
  const LeadNotesModel({required this.time, required this.content});
}

const List<LeadNotesModel> leadNotesList = [
  LeadNotesModel(time: '15-05-2024 10:42 am', content: 'Hello There'),
  LeadNotesModel(time: '16-05-2024 8:15 am', content: 'Good Morning'),
  LeadNotesModel(time: '17-05-2024 9:12 pm', content: 'Good Evening'),
  LeadNotesModel(time: '18-05-2024 12:30 am', content: 'Good Afternoon')
];
