﻿using System;

namespace Wearables.SyncService.IntegrationTest.Models
{
    public class StartTimerRequest
    {
        public Guid Id { get; set; }

        public string PartnerIdentifier { get; set; }

        public DateTime TimerEndDate { get; set; }
    }
}
