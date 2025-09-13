// To parse this JSON data, do
//
//     final Branches = BranchesFromJson(jsonString);

import 'dart:convert';

Branches BranchesFromJson(String str) => Branches.fromJson(json.decode(str));

String BranchesToJson(Branches data) => json.encode(data.toJson());

class Branches {
    final bool? status;
    final String? message;
    final List<Branch>? branches;

    Branches({
        this.status,
        this.message,
        this.branches,
    });

    factory Branches.fromJson(Map<String, dynamic> json) => Branches(
        status: json["status"],
        message: json["message"],
        branches: json["branches"] == null ? [] : List<Branch>.from(json["branches"]!.map((x) => Branch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
    };
}

class Branch {
    final int? id;
    final String? name;
    final int? patientsCount;
    final String? location;
    final String? phone;
    final String? mail;
    final String? address;
    final String? gst;
    final bool? isActive;

    Branch({
        this.id,
        this.name,
        this.patientsCount,
        this.location,
        this.phone,
        this.mail,
        this.address,
        this.gst,
        this.isActive,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        patientsCount: json["patients_count"],
        location: json["location"],
        phone: json["phone"],
        mail: json["mail"],
        address: json["address"],
        gst: json["gst"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location": location,
        "phone": phone,
        "mail": mail,
        "address": address,
        "gst": gst,
        "is_active": isActive,
    };
}
