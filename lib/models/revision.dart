// To parse this JSON data, do
//
//     final revision = revisionFromJson(jsonString);

import 'dart:convert';

Revision revisionFromJson(String str) => Revision.fromJson(json.decode(str));

String revisionToJson(Revision data) => json.encode(data.toJson());

class Revision {
  String subject;
  String descPreview;
  String fullDesc;
  String thumbnailUrl;
  String coverUrl;

  Revision({
    required this.subject,
    required this.descPreview,
    required this.fullDesc,
    required this.thumbnailUrl,
    required this.coverUrl,
  });

  factory Revision.fromJson(Map<String, dynamic> json) => Revision(
        subject: json["subject"],
        descPreview: json["desc_preview"],
        fullDesc: json["full_desc"],
        thumbnailUrl: json["thumbnail_url"],
        coverUrl: json["cover_url"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "desc_preview": descPreview,
        "full_desc": fullDesc,
        "thumbnail_url": thumbnailUrl,
        "cover_url": coverUrl,
      };
}
