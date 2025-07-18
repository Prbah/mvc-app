FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["mvc-app/mvc-app.csproj", "./"]
RUN dotnet restore "mvc-app.csproj"
COPY MyMvcApp/. .
RUN dotnet publish "mvc-app.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "mvc-app.dll"]

