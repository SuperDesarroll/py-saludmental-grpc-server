# py_saludmental_grpc_server

## Compilar docker

> docker build -t mygrpc .

## Ejecutar docker

> docker run -p 50051:50051 mygrpc


## creacion archivos protos
> python -m grpc_tools.protoc --proto_path=protos --python_out=. --grpc_python_out=. protos/servicio.proto 

## pruebas unitarias
> python3 -m pytest  -p no:warnings
