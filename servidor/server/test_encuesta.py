from mlsaludmental import MlDetection
from servicio_pb2 import EncuestaConfirmation
    
def test_predict(): 
    print("Test predict")
    mlObj = MlDetection()
    grid_cv  = mlObj.cargar()
    a = [[3,3,3]]
    print("Input: {}".format(a))
    r = grid_cv.predict(a)
    print("Predice: {}".format(r))    
    assert (r == [0])
