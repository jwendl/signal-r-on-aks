# Android Kotlin Application

Before running this sample, please modify src/client/wearablessyncexample/app/src/main/java/ScrollingActivity.kt by replacing the following

``` kotlin
        val hubConnection = HubConnectionBuilder.create("http://jwsignalraks.westus2.cloudapp.azure.com/startTimerHub")
            .build()
```

with

``` kotlin
        val hubConnection = HubConnectionBuilder.create("http://[ClusterName].[Location].cloudapp.azure.com/startTimerHub")
            .build()
```

| This is of course where [ClusterName] and [Location] are the respective values of your AKS cluster.