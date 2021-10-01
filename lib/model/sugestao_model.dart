class SugesModel {
  int status;
  List<Sucess> sucess;

  SugesModel({this.status, this.sucess});

  SugesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sucess'] != null) {
      sucess = new List<Sucess>();
      json['sucess'].forEach((v) {
        sucess.add(new Sucess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sucess != null) {
      data['sucess'] = this.sucess.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sucess {
  String id;
  String sugestao;
  String melhoria;

  Sucess({this.id, this.sugestao, this.melhoria});

  Sucess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sugestao = json['sugestao'];
    melhoria = json['melhoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sugestao'] = this.sugestao;
    data['melhoria'] = this.melhoria;
    return data;
  }
}
