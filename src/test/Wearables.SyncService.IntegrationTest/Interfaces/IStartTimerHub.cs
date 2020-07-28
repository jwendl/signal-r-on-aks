using System.Threading.Tasks;
using Wearables.SyncService.IntegrationTest.Models;

namespace Wearables.SyncService.IntegrationTest.Interfaces
{
    public interface IStartTimerHub
    {
        Task StartTimerEvent(string user, StartTimerRequest startTimerRequest);
    }
}
