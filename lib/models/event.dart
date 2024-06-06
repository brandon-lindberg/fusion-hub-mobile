class Event {
  final String title;
  final DateTime start;
  final DateTime end;
  final String location;
  final bool stream;
  final String? googleMapsUrl;
  final String? instagramUrl;
  final String description;

  Event({
    required this.title,
    required this.start,
    required this.end,
    required this.location,
    required this.stream,
    this.googleMapsUrl,
    this.instagramUrl,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      location: json['location'],
      stream: json['stream'],
      googleMapsUrl: json['googleMapsUrl'],
      instagramUrl: json['instagramUrl'],
      description: json['description'],
    );
  }
}
