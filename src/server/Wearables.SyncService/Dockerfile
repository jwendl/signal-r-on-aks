FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
COPY --from=build /app .
EXPOSE 5500/tcp
ENV ASPNETCORE_URLS http://*:5500
ENTRYPOINT ["dotnet", "Wearables.SyncService.dll"]
