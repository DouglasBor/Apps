
import 'dart:convert';

class MenuList {
    MenuList({
        required this.IdMenu,
        required this.ImagenMenu,
        required this.NombreMenu,
    });

    int IdMenu;
    String ImagenMenu;
    String NombreMenu;

    factory MenuList.fromJson(String str) => MenuList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MenuList.fromMap(Map<String, dynamic> json) => MenuList(
      IdMenu: json["IdMenu"],
      ImagenMenu: json["ImagenMenu"],
      NombreMenu: json["NombreMenu"],
    );

    Map<String, dynamic> toMap() => {
        "id": ImagenMenu,
        "tipoIdentificacion": NombreMenu,
    };
}
