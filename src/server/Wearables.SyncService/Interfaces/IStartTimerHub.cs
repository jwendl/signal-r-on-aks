using System.Threading.Tasks;
using Wearables.SyncService.Models;

namespace Wearables.SyncService.Interfaces
{
    public interface IStartTimerHub
    {
        Task StartTimerEvent(string user, StartTimerResponse startTimerResponse);
    }
}
