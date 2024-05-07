import 'package:http/http.dart' as http;

Future<void> registerUser(String user, String email, String pass) async {
  var url = Uri.http('http://localhost:3001', '/api/users');
  var response = await http.post(url, body: {
    'user': user,
    'email': email,
    'pass': pass,
  });

  if (response.statusCode == 200) {
    // Registro exitoso, puedes navegar a la pantalla principal
    // o mostrar un mensaje de éxito.
  } else {
    // Maneja los errores, como por ejemplo mostrar un mensaje
    // de error al usuario.
  }
}

Future<void> loginUser(String user, String pass) async {
  var url = Uri.http('http://localhost:3001', '/api/users');
  var response = await http.post(url, body: {
    'user': user,
    'pass': pass,
  });

  if (response.statusCode == 200) {
    // Autenticación exitosa, puedes navegar a la pantalla principal
    // o realizar otras acciones.
  } else {
    // Maneja los errores de autenticación, por ejemplo, mostrar
    // un mensaje al usuario indicando credenciales incorrectas.
  }
}
