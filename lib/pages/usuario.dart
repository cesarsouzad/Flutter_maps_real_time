class Usuario {
  bool? success;
  Data? data;
  String? message;

  Usuario({this.success, this.data, this.message});

  Usuario.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? name;
  String? email;
  String? senha;
  bool? authorizeLocation;

  Data(
      {this.token,
      this.name,
      this.email,
      this.senha,
      this.authorizeLocation}); // Atualize o construtor

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email']; // Adicione esta linha
    senha = json['password']; // Adicione esta linha
    authorizeLocation = json['authorize_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.senha;
    data['authorize_location'] = this.authorizeLocation;
    return data;
  }

  String toString() {
    return 'Usuario(message: $name, token: $token)';
  }
}
