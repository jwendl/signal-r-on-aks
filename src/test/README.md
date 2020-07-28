# Test Client

To run the test client please be sure to have the dotnet cli installed with [.NET Core 3.1 SDK](https://dotnet.microsoft.com/download)

Open up a command prompt to the src/test/Wearables.SyncService.IntegrationTests/ folder and run the following command(s) (example using Ubuntu or WSL on Windows)

``` bash
export SYNC_SERVICE_PATH="http://[Public DNS Name of Cluster]/startTimerHub"
```

| To get the public DNS of the cluster, head to the Azure portal and look for the resource group that is similar to MC_[ResourceGroupName]\_[ClusterName]\_[Location] and look for the Public IP resource. Inside that resource it should have a full DNS name to use above.
