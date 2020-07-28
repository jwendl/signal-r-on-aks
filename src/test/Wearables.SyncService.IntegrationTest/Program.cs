using Microsoft.AspNetCore.SignalR.Client;
using System;
using System.Threading;
using System.Threading.Tasks;
using Wearables.SyncService.IntegrationTest.Interfaces;
using Wearables.SyncService.IntegrationTest.Models;

namespace Wearables.SyncService.IntegrationTest
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var syncServicePath = Environment.GetEnvironmentVariable("SYNC_SERVICE_PATH");
            Console.WriteLine($"Connecting to {syncServicePath}");

            var hubConnection = new HubConnectionBuilder()
                .WithUrl(syncServicePath)
                .Build();

            hubConnection.On<string, StartTimerResponse>("StartTimerEvent", (user, startTimerResponse) =>
            {
                Console.WriteLine($"{user}: {startTimerResponse.PartnerIdentifier} at {startTimerResponse.TimerEndDate}");
            });

            Console.WriteLine("Press Ctrl+C to Exit.");
            await hubConnection.StartAsync();
            while (true)
            {
                await hubConnection.InvokeAsync<IStartTimerHub>("StartTimer", "Test Client", new StartTimerRequest()
                {
                    Id = Guid.NewGuid(),
                    PartnerIdentifier = "CLI Client",
                    TimerEndDate = DateTime.Now.AddMinutes(30),
                });

                Thread.Sleep(1000);
            }
        }
    }
}
