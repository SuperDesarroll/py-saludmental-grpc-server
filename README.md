# py_saludmental_grpc_server

python -m grpc_tools.protoc --proto_path=definiciones --python_out=server --grpc_python_out=server definiciones/servicio.proto 