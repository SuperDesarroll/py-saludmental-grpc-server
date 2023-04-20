from concurrent import futures
from datetime import datetime, timedelta

import grpc

from mlsaludmental import MlDetection
from servicio_pb2 import OrderConfirmation
from servicio_pb2 import EncuestaConfirmation
from servicio_pb2_grpc import PizzeriaServicer, add_PizzeriaServicer_to_server

class PizzeriaService(PizzeriaServicer):

    def IsReady(self, request, context):
        return request

    def RegisterEncuesta(self, request, context):
        print(request.desinteres_diversion)
        a = [[            
            request.desinteres_diversion,
            request.fracasado,  
            request.irritado
        ]]
        print("Input: {}".format(a))
        r = self.grid_cv.predict(a)
        print("Predice: {}".format(r))
        return EncuestaConfirmation(prediccion=r[0])

    def RegisterOrder(self, request, context):
        print("New order received:")
        print(f"\tFrom: {request.customer_name}")
        print(f"\tTo: {request.address}")
        print("\tPizzas:")
        for idx, pizza in enumerate(request.pizzas, 1):
            toppings = ", ".join(pizza.toppings)
            print(f"\t\tPizza {idx}: {pizza.inches}\" ({toppings})")

        estimated_delivery = (datetime.now() + timedelta(minutes=30)) - datetime(1970, 1, 1)
        return OrderConfirmation(estimated_delivery=int(estimated_delivery.total_seconds()))

    def iniciarML(self):
        mlObj = MlDetection()
        self.grid_cv  = mlObj.cargar()

def serve():    
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    objPizzeria = PizzeriaService()
    objPizzeria.iniciarML()
    add_PizzeriaServicer_to_server(objPizzeria, server)
    server.add_insecure_port('[::]:50051')
    print("The server is running!")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()