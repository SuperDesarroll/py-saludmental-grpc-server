// The port number must match the port of the gRPC server.
using Grpc.Net.Client;
using GrpcGreeter;

using var channel = GrpcChannel.ForAddress("http://localhost:5288");
var client = new Greeter.GreeterClient(channel);
var reply = await client.SayHelloAsync(
                  new HelloRequest { Name = "GreeterClient" });
Console.WriteLine("Greeting: " + reply.Message);
Console.WriteLine("Press any key to exit...");
Console.ReadKey();