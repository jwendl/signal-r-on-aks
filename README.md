# Signal R on AKS

This is an example of using a Kotlin client to access [ASP.NET SignalR](https://dotnet.microsoft.com/apps/aspnet/signalr) services hosted on [Azure Kubernetes Service](https://azure.microsoft.com/en-us/services/kubernetes-service/).

Essentially, we have a pod that is running in an Azure Kubernetes Service cluster that is running a docker container that has Azure Signal R. We also deploy a Redis container to the cluster to use as the backplane for Signal R.

There are two clients here, one is under [src/test](src/test/README.md) and the other under [src/client](src/client/README.md). The [src/test](src/test/README.md) project contains an application written in .NET Core and simulates sending messages to Signal R every second. The [src/client](src/client/README.md) repository is an Android application using [Android App Studio](https://developer.android.com/studio/) written in [Kotlin](https://kotlinlang.org/) using the [ASP.NET Core SignalR Java client](https://docs.microsoft.com/en-us/aspnet/core/signalr/java-client). 

## Getting Started

To install this project into your own Azure Subscription at a high level involves the following steps:

1. Deploy the infrastructure using [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) - follow these [steps](deploy/terraform/README.md)
1. Build the [docker](https://docs.docker.com/get-started/) image and push to [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) - follow these [steps](deploy/docker/README.md)
1. Pull the application into our [Azure Kubernetes Service](https://azure.microsoft.com/en-us/services/kubernetes-service) cluster using [Helm](https://helm.sh/docs/chart_template_guide/getting_started/) - follow these [steps](deploy/helm/README.md)
1. Run the Android application - follow these [steps](src/client/README.md)
1. Run the Test application - follow these [steps](src/test/README.md)

| The last two steps for the clients are run at the same time.

## Documentation Conventions

Each folder will have a README.md file in it with a "getting started" guide. If there is something in an example command-line wrapped inside square brackets, that is considered something you replace with your own values.

## Contributing

Will be moved to the Microsoft Open Source Repository eventually... - TBD