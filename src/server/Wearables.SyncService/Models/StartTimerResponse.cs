using System;

namespace Wearables.SyncService.Models
{
    public class StartTimerResponse
    {
        public string PartnerIdentifier { get; set; }

        public DateTime TimerEndDate { get; set; }
    }
}
