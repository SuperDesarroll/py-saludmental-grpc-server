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
  ).Execute(() => GetClient("http://mypython.koreasouth.cloudapp.azure.com:50051"));

Encuesta encuesta = new Encuesta()
{
    DesinteresDiversion = 1,
    Fracasado = 1,
    Irritado = 1
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

static string ToDateString(long date)
{
    var dt = DateTime.MinValue.AddSeconds(date);
    return dt.ToShortDateString() + " " + dt.ToShortTimeString();
}