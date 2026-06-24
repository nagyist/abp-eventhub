  FROM mcr.microsoft.com/dotnet/aspnet:10.0-jammy
  COPY bin/Release/net10.0/ app/
  WORKDIR /app
  EXPOSE 80
  ENV ASPNETCORE_URLS=http://+:80
  ENTRYPOINT ["dotnet", "EventHub.DbMigrator.dll"]