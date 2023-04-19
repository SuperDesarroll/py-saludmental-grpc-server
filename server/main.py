from servicio_pb2_grpc import PizzeriaServicer, add_PizzeriaServicer_to_server
from servicio_pb2 import ConfirmacionOrden

import grpc
from concurrent import futures

class ServicioPizzeria(PizzeriaServicer):
    def __init__(self):
        pass

    def Listo(self, request, context):
        return request
    
    def RegistrarOrden(self, request, context):
        print("Orden recibida {request.direccion}, pizzas {len(request.pizzas)}")
        return ConfirmacionOrden(entrega_estimada=10)

def start():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    add_PizzeriaServicer_to_server(ServicioPizzeria(), server)
    server.add_insecure_port('[::]:50051')
    print("Servidor iniciado en puerto 50051")
    server.start()
    server.wait_for_termination()
    server.stop(0)
    print("Servidor detenido")

if __name__ == '__main__':
    start()