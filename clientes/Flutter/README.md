# cliente saludmental grPC

Desarrollado en Flutter

[Instalar Flutter](https://flutter.dev/?gclid=CjwKCAjw6IiiBhAOEiwALNqncS6_f7y3FPKQhKAn1sVdrH4SD80aW1PYdxLNyOuReSbG_rTWFGUvrBoC1ogQAvD_BwE&gclsrc=aw.ds "Instalar Flutter")

# Compilar archivos proto macOS

Abre la terminal de tu Mac.

Instala protoc (el compilador de protobuf) usando Homebrew. Si no tienes Homebrew instalado, puedes seguir las instrucciones en https://brew.sh/ para instalarlo.

Instala protoc-gen-dart usando pub, el administrador de paquetes de Dart.

> brew install protobuf

Crea la variables de entorno

> export PATH="$PATH":"$HOME/.pub-cache/bin"

Guarda el archivo y ejecuta el siguiente comando para recargar la configuración de tu terminal:

> source ~/.bash_profile

Compila el archivo proto

> protoc --proto_path=protos  --dart_out=grpc:generated -Iprotos servicio.proto


![app](https://raw.githubusercontent.com/SuperDesarroll/py_saludmental_grpc_server/main/clientes/Flutter/android/videoappsaludmental.gif "app")
