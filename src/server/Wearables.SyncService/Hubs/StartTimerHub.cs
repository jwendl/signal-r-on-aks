using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using Wearables.SyncService.Interfaces;
using Wearables.SyncService.Models;

namespace Wearables.SyncService.Hubs
{
    public class StartTimerHub
        : Hub<IStartTimerHub>
    {
        public async Task StartTimer(string user, StartTimerRequest startTimerRequest)
        {
            var startTimerResponse = new StartTimerResponse()
            {
                PartnerIdentifier = startTimerRequest.PartnerIdentifier,
                TimerEndDate = startTimerRequest.TimerEndDate,
            };
            await Clients.All.StartTimerEvent(user, startTimerResponse);
        }
    }
}
