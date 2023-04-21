# saludmental

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


protoc --proto_path=/Users/dmg/Documents/devs/github/py_saludmental_grpc_server/definiciones --dart_out=build/gen servicio.proto

protoc-gen-dart --proto_path=/Users/dmg/Documents/devs/github/py_saludmental_grpc_server/definiciones --dart_out=build/gen servicio.proto


Para instalar protoc-gen-dart en una Mac, puedes seguir los siguientes pasos:

Abre la terminal de tu Mac.

Instala protoc (el compilador de protobuf) usando Homebrew. Si no tienes Homebrew instalado, puedes seguir las instrucciones en https://brew.sh/ para instalarlo.

Copy code
brew install protobuf
Instala protoc-gen-dart usando pub, el administrador de paquetes de Dart.

csharp
Copy code
pub global activate protoc_plugin
Agrega el directorio ~/.pub-cache/bin a tu variable de entorno $PATH. Para hacerlo, abre el archivo .bash_profile en tu directorio de inicio (o crea uno si no existe) y agrega la siguiente línea:

bash
Copy code
export PATH="$PATH":"$HOME/.pub-cache/bin"
Guarda el archivo y ejecuta el siguiente comando para recargar la configuración de tu terminal:

bash
Copy code
source ~/.bash_profile
Ahora que has instalado protoc-gen-dart y configurado tu variable de entorno $PATH, puedes usar el compilador protoc junto con protoc-gen-dart para generar código Dart a partir de tus archivos protobuf. Por ejemplo, si tienes un archivo foo.proto, puedes generar el código Dart correspondiente ejecutando el siguiente comando:

css
Copy code
protoc --dart_out=<output_directory> foo.proto
Asegúrate de reemplazar <output_directory> con el directorio donde quieres que se genere el código Dart.


protoc --proto_path=. --dart_out=. servicio.proto      


protoc --proto_path=protos  --dart_out=grpc:generated -Iprotos servicio.proto