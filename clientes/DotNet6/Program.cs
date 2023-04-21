using Client;
using Grpc.Core;
using Grpc.Net.Client;
using Polly;
using System;
using System.IO;
using System.Threading;

var random = new Random();

var client = Policy
  .Handle<Exception>()
  .WaitAndRetry(
    5,
    retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)),
    (exception, timeSpan, context) =>
    {
        Console.WriteLine($"Server not available yet!");
    }
  ).Execute(() => GetClient("http://localhost:50051"));


/*
Desinteres Diversion
1 )  Casi todos los días
2 )  Más de la mitad de los días
3 )  Para Nada / Ningún día
4 )  Varios días

Fracasado
1 )  Casi todos los días
2 )  Más de la mitad de los días
3 )  Para Nada / Ningún día
4 )  Varios días

Irritado
1 )  Casi todos los días
2 )  Más de la mitad de los días
3 )  Para Nada / Ningún día
4 )  Varios días
*/
Encuesta encuesta = new Encuesta()
{
    DesinteresDiversion = 3,
    Fracasado = 3,
    Irritado = 4
};

EncuestaConfirmation encuestaConfirmation = client.RegisterEncuesta(encuesta);
Console.WriteLine($"Encuesta Predicción: {encuestaConfirmation.Prediccion}");

static SaludMental.SaludMentalClient GetClient(string address)
{
    // This switch must be set before creating the GrpcChannel/HttpClient.
    AppContext.SetSwitch(
        "System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", true);

    var channel = GrpcChannel.ForAddress(address);
    var client = new SaludMental.SaludMentalClient(channel);
    client.IsReady(new Empty());
    return client;
}
