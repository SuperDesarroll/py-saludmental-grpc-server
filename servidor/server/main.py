from concurrent import futures
from datetime import datetime, timedelta
import grpc
from mlsaludmental import MlDetection
from servicio_pb2 import EncuestaConfirmation
from servicio_pb2_grpc import SaludMentalServicer, add_SaludMentalServicer_to_server

class SaludMentalService(SaludMentalServicer):

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

    def iniciarML(self):
        mlObj = MlDetection()
        self.grid_cv  = mlObj.cargar()

def serve():    
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    objSaludMental = SaludMentalService()
    objSaludMental.iniciarML()
    add_SaludMentalServicer_to_server(objSaludMental, server)
    server.add_insecure_port('[::]:50051')
    print("The server is running!")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()